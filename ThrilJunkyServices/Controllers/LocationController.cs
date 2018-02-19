using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace ThrilJunkyServices.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    [Consumes("application/json")]
    public class LocationController : Controller
    {

        private readonly ILocationRepository locationRepository;
        private  readonly IConfiguration config;
        
        public LocationController(ILocationRepository _locationRepository, IConfiguration _config)
        {
            locationRepository = _locationRepository;
            config = _config;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(locationRepository.GetAll());
        }

        [HttpGet("{Id}")]
        public Location GetItem(int id)
        {
            Location item = locationRepository.GetByID(id);

            return item;
        }

        [HttpPost]
        public async Task<IActionResult> Modify([FromBody]Location item)
        {
            try
            {
                await locationRepository.Add(item);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.GetBaseException().Message);
            }
            return Ok(item);
        }


    }
}
