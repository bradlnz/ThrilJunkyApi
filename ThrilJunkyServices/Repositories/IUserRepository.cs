using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IUserRepository
    {
        Task<User> Add(User user);
        List<User> GetAll();
        User GetByID(int id);
    }
}
