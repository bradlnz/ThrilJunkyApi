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

        public async Task<Tag> Add(Tag tag)
        {

            using (IDatabase db = Connection)
            {
                var existing = await db.FetchAsync<Tag>($"SELECT * FROM Tag WHERE Text LIKE '%{tag.Text}%'");

                if (existing == null || !existing.Any())
                {
                    await db.InsertAsync<Tag>(tag);

                    var item = await db.FetchAsync<Tag>($"SELECT * FROM Tag WHERE TagId = {tag.TagId}");

                    return item.First();
                }

                return existing.First();
            }
        }

        public async Task AddPostTag(PostTag postTag)
        {
            using (IDatabase db = Connection)
            {
                await db.InsertAsync<PostTag>(postTag);
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
