using System;
using System.Collections.Generic;
using NPoco;
using ThrilJunkyServices.Models;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using ThrilJunkyServices.ViewModels;
using System.Linq;
using Azure.MediaServices.Core;
using Microsoft.WindowsAzure.Storage.Auth;
using System.Threading;
using Azure.MediaServices.Core.Jobs;
using Azure.MediaServices.Core.Assets;

namespace ThrilJunkyServices.Repositories
{
    public class MediaRepository : IMediaRepository
    {
      
        private  readonly IConfiguration _config;
        private readonly IAzureMediaServiceClient _client;

        public MediaRepository(IConfiguration config) 
        {
            _config = config;
            _client = new AzureMediaServiceClient(config["ClientId"], config["ClientKey"], config["MediaServicesRestApi"], config["TenantDomain"]);
        }

        public IDatabase Connection
        {
            get
            {
                return new Database(_config["ConnectionStrings:DefaultConnection"], DatabaseType.SqlServer2008, SqlClientFactory.Instance);
            }
        }

        public async Task Add(Media media)
        {

            using (IDatabase db = Connection)
            {
                await db.InsertAsync<Media>(media);
            }
        }

        public List<Media> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Media>("SELECT * FROM Media");
            }
        }

        public Media GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<Media>(id);
            }
        }

        public async Task<MediaType> GetType(string extension)
        {
            using (IDatabase db = Connection)
            {
                var results = await db.FetchAsync<MediaType>($"SELECT * FROM MediaType WHERE Type = '{extension}'");

                if(!results.Any())
                {
                    var results2 = await db.FetchAsync<MediaType>($"SELECT * FROM MediaType");

                    var mediaType = new MediaType()
                    {
                        Type = extension
                    };

                    await db.InsertAsync<MediaType>(mediaType);

                    var results3 = await db.FetchAsync<MediaType>($"SELECT * FROM MediaType WHERE MediaTypeId = '{mediaType.MediaTypeId}'");

                    return results3.First();

                }
                return results.First();
            }
        }
        
        public async Task<Media> Upload(
            string connectionString,
            string containerName,
            string blobName,
            string extension,
            IFormFile file)
        {
            var cloudStorageAccount = CloudStorageAccount.Parse(connectionString);
            var cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
            var cloudBlobContainer = cloudBlobClient.GetContainerReference(containerName);
            var cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference(blobName);


         
            using (var fileStream = file.OpenReadStream())
            {
                cloudBlockBlob.Properties.ContentType = file.ContentType;
                await cloudBlockBlob.UploadFromStreamAsync(fileStream);
            }

    
            var type = await GetType(extension);


            if(type.Type == "mp4"){

                StorageCredentials storageCredentials = new StorageCredentials(_config["StorageAccountName"], _config["StorageAccountKey"]);

                await _client.InitializeAsync();

                var asset = await _client.CreateFromBlobAsync(cloudBlockBlob, storageCredentials, CancellationToken.None);


                List<Asset> assets = new List<Asset>();

                assets.Add(asset);

                JobTask task = new JobTask();

                task.Name = "Adaptive Streaming";
                task.Configuration = "Adaptive Streaming";
                task.MediaProcessorId = "nb:mpid:UUID:ff4df607-d419-42f0-bc17-a481b1331e56";
                task.TaskBody = "<?xml version=\"1.0\" encoding=\"utf-8\"?><taskBody><inputAsset>JobInputAsset(0)</inputAsset><outputAsset>JobOutputAsset(1)</outputAsset></taskBody>";
                List<JobTask> tasks = new List<JobTask>();

                tasks.Add(task);


                var job = new Job("Media Encoder Standard", assets.ToArray(), tasks.ToArray());


                var job2 = await _client.CreateJob(job);

                var outputAsset = await _client.GetJobOutputAsset(job2.Id);

                var policy = await _client.CreateAccessPolicy("DownloadPolicy", 30000000, 1);

                var locator = await _client.CreateLocator(policy.Id, outputAsset.First().Id, DateTime.Now, 2);


                var url = $"{locator.Path}{asset.Name.Replace(".mp4", ".ism")}/manifest";


                if (!string.IsNullOrWhiteSpace(url))
                {



                    var media = new Media
                    {
                        MediaUrl = url,
                        MediaTypeId = type.MediaTypeId,
                        CreatedDate = DateTime.UtcNow,
                    };

                    await Add(media);

                    return media;
                }

                return new Media();
            } else {
                
                var media = new Media
                {
                    MediaUrl = cloudBlockBlob.Uri.AbsoluteUri,
                    MediaTypeId = type.MediaTypeId,
                    CreatedDate = DateTime.UtcNow,
                };

                await Add(media);

                return media;
            }
           
        }

    }
}
