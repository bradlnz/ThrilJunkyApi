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
    public class HintRepository : IHintRepository
    {
      
        private  readonly IConfiguration _config;

        public HintRepository(IConfiguration config) 
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

        public async Task Add(Hint hint)
        {

            using (IDatabase db = Connection)
            {
                await db.InsertAsync<Hint>(hint);
            }
        }

        public List<Hint> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Hint>("SELECT * FROM Hint");
            }
        }
        
        public List<Hint> GetAllByPostId(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Hint>($"SELECT * FROM Hint WHERE PostId = '{id}'");
            }
        }

        public Hint GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<Hint>(id);
            }
        }

    }
}
