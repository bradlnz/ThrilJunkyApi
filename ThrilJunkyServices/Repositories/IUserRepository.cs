﻿using System;
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
        User GetById(string id);
        Task<User> FindByResetCode(string resetCode);
    }
}
