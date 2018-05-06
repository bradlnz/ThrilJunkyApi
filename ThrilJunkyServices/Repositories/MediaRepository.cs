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
using Microsoft.AspNetCore.Hosting;
using Amazon.S3;
using Amazon;
using Amazon.S3.Transfer;
using Amazon.S3.Model;
using System.IO;

namespace ThrilJunkyServices.Repositories
{
    public class MediaRepository : IMediaRepository
    {


        private readonly IConfiguration _config;
        private readonly IAzureMediaServiceClient _client;
        private IHostingEnvironment _hostingEnvironment;
        private IAmazonS3 _s3Client { get; set; }

        private static string _bucketSubdirectory = String.Empty;


        public MediaRepository(IConfiguration config, IHostingEnvironment environment, IAmazonS3 client)
        {
            _config = config;
            _hostingEnvironment = environment;
            _s3Client = client;
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

                if (!results.Any())
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
            string bucketName,
            string fileName,
            string extension,
            IFormFile file)
        {

            using (var fileStream = file.OpenReadStream())
            {


                var request = new PutObjectRequest
                {
                    InputStream = fileStream,
                    BucketName = "thriljunky",
                    Key = $"uploads/{fileName}",
                };


                var type = GetType(extension);

                if (extension == ".mp4")
                {
                    request.ContentType = "video/mp4";
                }


                var response = await _s3Client.PutObjectAsync(request);


                var media = new Media
                {
                    MediaUrl = $"{bucketName}/uploads/{fileName}",
                    MediaTypeId = type.Id,
                    CreatedDate = DateTime.UtcNow,
                };

                await Add(media);

                if (media.MediaUrl.EndsWith(".jpg", StringComparison.InvariantCulture) || media.MediaUrl.EndsWith(".png", StringComparison.InvariantCulture)) return media;
                    try
                    {

                        var config = System.IO.File.ReadAllText("coconut.conf");
           
                        config = config.Replace("{PLACEHOLDER}", fileName.Replace(".mp4", ""));

                        config = config.Replace("{MEDIAURL}", media.MediaUrl);

                        Coconut.CoconutAPI coconut = new Coconut.CoconutAPI("k-f14ddfef86ef1a1f260063f5a1746eba");

                        coconut.Submit(config);

                    }
                    catch (Exception ex)
                    {
                        var err = ex.Message;
                    }
           
                return media;
            }
        }
    }

}

