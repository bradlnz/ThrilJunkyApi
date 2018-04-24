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
        Task<MediaType> GetType(string extension);
        Task<Media> Upload(
            string bucketName,
            string fileName,
            string extension,
            IFormFile file);
    }
}
