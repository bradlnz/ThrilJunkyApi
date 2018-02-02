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
    public class TagRepository : ITagRepository
    {
      
        private  readonly IConfiguration _config;

        public TagRepository(IConfiguration config) 
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

        public async Task Add(Tag tag)
        {

            using (IDatabase db = Connection)
            {
                await db.InsertAsync<Tag>(tag);
            }
        }

        public List<Tag> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Tag>("SELECT * FROM Tag");
            }
        }

        public Tag GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<Tag>(id);
            }
        }

    }
}
