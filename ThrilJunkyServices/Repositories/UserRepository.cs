using NPoco.DatabaseTypes;
using Microsoft.Extensions.Configuration;
using NPoco;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly IConfiguration _config;

        public UserRepository(IConfiguration config)
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

        public async Task<User> Add(User user)
        {

            using (IDatabase db = Connection)
            {
                var existing = await db.FetchAsync<User>($"SELECT * FROM User WHERE Username = '{user.Username}'");

                if (existing == null || !existing.Any())
                {
                    await db.InsertAsync<User>(user);

                    var item = await db.FetchAsync<User>($"SELECT * FROM User WHERE Username = '{user.Username}'");

                    return item.First();
                }

                return existing.First();
            }
        }

        public List<User> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<User>("SELECT * FROM User");
            }
        }

        public User GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<User>(id);
            }
        }

    }
}
