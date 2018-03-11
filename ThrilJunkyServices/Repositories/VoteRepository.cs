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
    public class VoteRepository : IVoteRepository
    {
      
        private  readonly IConfiguration _config;

        public VoteRepository(IConfiguration config) 
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

        public async Task<Vote> Add(Vote vote)
        {

            using (IDatabase db = Connection)
            {
                var existing = await db.FetchAsync<Vote>($"SELECT * FROM Vote WHERE UserId = '{vote.UserId}' AND PostId = '{vote.PostId}'");

                if (existing == null || !existing.Any())
                {
                    await db.InsertAsync<Vote>(vote);

                    var item = await db.FetchAsync<Vote>($"SELECT * FROM Vote WHERE UserId = '{vote.UserId}' AND PostId = '{vote.PostId}'");

                    return item.First();
                }

                return existing.First();
            }
        }

        public List<Vote> GetAllByPostId(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Vote>($"SELECT * FROM Vote WHERE PostId = '{id}'");
            }
        }
    
        public List<Vote> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Vote>("SELECT * FROM Vote");
            }
        }

        public Vote GetByID(int id, string userId)
        {
            using (IDatabase db = Connection)
            {
                return db.FirstOrDefault<Vote>($"SELECT * FROM Vote WHERE UserId = '{userId}' AND PostId = '{id}'");
            }
        }

    }
}
