using System;
using System.Collections.Generic;
using NPoco;
using ThrilJunkyServices.Models;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace ThrilJunkyServices.Repositories
{
    public class PostRepository : IPostRepository
    {
      
        private  readonly IConfiguration _config;

        public PostRepository(IConfiguration config) 
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

        public void AddOrUpdate(Post post)
        {

            using (IDatabase db = Connection)
            {
                db.BeginTransaction();
                //Your CRUD operation here

                db.Save<Post>(post);


                db.CompleteTransaction();
            }
        }

        public List<Post> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Post>("SELECT * FROM Post");
            }
        }

        public List<Post> GetAllByLocationOrderByCreatedDate(float latitude, float longitude, int radius)
        {
            using(IDatabase db = Connection)
            {
                return db.Fetch<Post>($"SELECT p.*, l.* FROM Post p INNER JOIN Location l on l.LocationId = p.LocationId WHERE dbo.GetDistanceBetween({latitude}, {longitude}, l.latitude, l.longitude) <= {radius};");
            }
        }

        public Post GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<Post>(id);
            }
        }

    }
}
