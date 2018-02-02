using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface ITagRepository
    {
        Task Add(Tag location);
        List<Tag> GetAll();
        Tag GetByID(int id); 
    }
}
