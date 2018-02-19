using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface ITagRepository
    {
        Task<Tag> Add(Tag tag);
        List<Tag> GetAll();
        Tag GetByID(int id);
        Task AddPostTag(PostTag postTag);
    }
}
