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

        public async Task<User> FindByResetCode(string resetCode)
        {
            using (IDatabase db = Connection)
            {
                return await db.SingleAsync<User>($"SELECT * FROM [dbo].[AspNetUsers] WHERE ResetCode = '{resetCode}'");
            }
        }

        public List<User> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<User>("SELECT * FROM [dbo].[AspNetUsers]");
            }
        }

        public User GetById(string id)
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<User>($"SELECT * FROM [dbo].[AspNetUsers] WHERE Id = '{id}'").FirstOrDefault();
            }
        }

        public User GetItem(string username)
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<User>($"SELECT * FROM [dbo].[AspNetUsers] WHERE username = '{username}'").FirstOrDefault();
            }
        }

        public int Modify(User user)
        {
            using (IDatabase db = Connection)
            {
                return db.Execute($"UPDATE [dbo].[AspNetUsers] SET MediaId='{user.MediaId}', ResetCode='{user.ResetCode}' WHERE Id = '{user.Id}'");
            }
        }

  
    }
}
