using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IReportingRepository
    {
        Task Add(ReportedItem reportedItem);
        List<ReportedItem> GetAllByPostId(int id);
    }
}
