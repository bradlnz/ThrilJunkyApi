using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IUserRepository
    {
        List<User> GetAll();
        int Modify(User user);
        User GetItem(string username);
    }
}
