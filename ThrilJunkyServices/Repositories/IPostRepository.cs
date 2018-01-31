﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IPostRepository
    {
        void AddOrUpdate(Post post);
        List<Post> GetAll();
        Post GetByID(int id);
    }
}
