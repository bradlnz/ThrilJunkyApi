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
    public class ReportingRepository : IReportingRepository
    {
      
        private  readonly IConfiguration _config;

        public ReportingRepository(IConfiguration config) 
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

        public async Task Add(ReportedItem reportedItem)
        {

            using (IDatabase db = Connection)
            {
                await db.InsertAsync<ReportedItem>(reportedItem);
            }
        }

        public List<ReportedItem> GetAllByPostId(int id)
        {
            using (IDatabase db = Connection)
            {
                return db.Fetch<ReportedItem>($"SELECT * FROM ReportedItems WHERE PostId = '{id}'");
            }
        }

    }
}
