using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.Repositories
{
    public interface IMediaRepository
    {
        void AddOrUpdate(Media post);
        List<Media> GetAll();
        Media GetByID(int id);
        string Upload(
            string connectionString,
            string containerName,
            string blobName,
            IFormFile file);
    }
}
