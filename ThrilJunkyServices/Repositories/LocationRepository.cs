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
    public class LocationRepository : ILocationRepository
    {
      
        private  readonly IConfiguration _config;

        public LocationRepository(IConfiguration config) 
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

        public async Task<Location> Add(Location location)
        {

            using (IDatabase db = Connection)
            {
                var existing = await db.FetchAsync<Location>($"SELECT * FROM Location WHERE Address LIKE '%{location.Address}%' OR Name LIKE '%{location.Name}%'");

                if(existing == null || !existing.Any())
                {
                    await db.InsertAsync<Location>(location);

                    var item = await db.FetchAsync<Location>($"SELECT * FROM Location WHERE LocationId = {location.LocationId}");

                    return item.First();
                }

                return existing.First();
            }
        }

        public List<Location> GetAll()
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<Location>("SELECT * FROM Location");
            }
        }

        public Location GetByID(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.SingleById<Location>(id);
            }
        }

    }
}
