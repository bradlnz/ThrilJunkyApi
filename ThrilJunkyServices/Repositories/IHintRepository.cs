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
        List<Hint> GetAllByPostId(int id);
        Hint GetByID(int id);
    }
}
