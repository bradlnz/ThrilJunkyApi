using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IHintRepository
    {
        Task Add(Hint hint);
        List<Hint> GetAll();
        Hint GetByID(int id);
    }
}
