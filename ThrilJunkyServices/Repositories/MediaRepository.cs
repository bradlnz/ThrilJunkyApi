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

namespace ThrilJunkyServices.Repositories
{
    public class MediaRepository : IMediaRepository
    {
      
        private  readonly IConfiguration _config;

        public MediaRepository(IConfiguration config) 
        {
            _config = config;
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
                        MediaTypeId = results2.Last().MediaTypeId + 1,
                        Type = extension
                    };

                    await db.InsertAsync<MediaType>(mediaType);

                    var results3 = await db.FetchAsync<MediaType>($"SELECT * FROM MediaType WHERE MediaTypeId = '{mediaType.MediaTypeId}'");

                    return results3.First();;

                }
                return results.First();
            }
        }
        
        public async Task<string> Upload(
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

            var url = cloudBlockBlob.Uri.AbsoluteUri;

            if (!string.IsNullOrWhiteSpace(url))
            {

                var type = await GetType(extension);
                    
                 var media = new Media
                   {
                       MediaUrl = url,
                    MediaTypeId = type.MediaTypeId,
                       CreatedDate = DateTime.UtcNow,
                   };

                    await Add(media);
 
            }

            return url;
        }

    }
}
