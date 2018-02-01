using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.ViewModels;

namespace ThrilJunkyServices.Repositories
{
    public interface IMediaRepository
    {
        Task Add(Media post);
        List<Media> GetAll();
        Media GetByID(int id);
        Task<string> Upload(
            string connectionString,
            string containerName,
            string blobName,
            IFormFile file);
    }
}
