using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IVoteRepository
    {
        Task<Vote> Add(Vote tag);
        List<Vote> GetAll();
        Vote GetByID(int id, string userId);
    }
}
