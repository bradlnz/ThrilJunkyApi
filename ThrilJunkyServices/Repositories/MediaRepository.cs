using System;
using System.Collections.Generic;
using NPoco;
using ThrilJunkyServices.Models;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

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

    }
}