using System;
using System.Collections.Generic;
using NPoco;
using ThrilJunkyServices.Models;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.WindowsAzure.Storage;

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

        public void AddOrUpdate(Media media)
        {

            using (IDatabase db = Connection)
            {
                db.BeginTransaction();
                //Your CRUD operation here

                db.Save<Media>(media);


                db.CompleteTransaction();
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
        
        
          public static string Upload(
            string connectionString,
            string containerName,
            string blobName,
            HttpPostedFileBase file)
        {
            var cloudStorageAccount = CloudStorageAccount.Parse(connectionString);
            var cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
            var cloudBlobContainer = cloudBlobClient.GetContainerReference(containerName);
            var cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference(blobName);

            using(var fileStream = file.InputStream)
            {
                cloudBlockBlob.Properties.ContentType = file.ContentType;
                cloudBlockBlob.UploadFromStream(fileStream);
            }

            return cloudBlockBlob.Uri.AbsoluteUri;
        }


    }
}
