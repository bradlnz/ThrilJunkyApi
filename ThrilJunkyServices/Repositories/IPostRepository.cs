using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IPostRepository
    {
        void AddOrUpdate(Post post);
        void AddOrUpdateBucket(Bucket bucket);
        List<Post> GetAll();
        Post GetByID(int id);
        List<Post> GetAllByLocationOrderByCreatedDate(float latitude, float longitude, int radius);
        List<Post> GetAllByUserId(string userId);
        List<Post> GetAllByUserIdBucket(string userId);
        List<Bucket> GetBucketById(int postId, string userId);
    }
}
