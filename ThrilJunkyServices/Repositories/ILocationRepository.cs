using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.ViewModels;

namespace ThrilJunkyServices.Repositories
{
    public interface ILocationRepository
    {
        Task<Location> Add(Location location);
        List<Location> GetAll();
        Location GetByID(int id);
    }
}
