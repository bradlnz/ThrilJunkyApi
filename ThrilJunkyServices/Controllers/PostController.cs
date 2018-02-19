using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;

namespace ThrilJunkyServices.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    public class PostController : Controller
    {

        private readonly IPostRepository postRepository;

        public PostController(IPostRepository _postRepository)
        {
            postRepository = _postRepository;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(postRepository.GetAll());
        }

        [HttpPost]
        [Route("GetAllByLocationOrderByCreatedDate")]
        public IActionResult GetAllByLocationOrderByCreatedDate([FromBody] LocationSearch item)
        {
            return Ok(postRepository.GetAllByLocationOrderByCreatedDate(item.lat,item.lng, item.radius).ToList().GroupBy(a => a.LocationId));
        }

        [HttpGet("{Id}")]
        public Post GetItem(int id)
        {
            Post item = postRepository.GetByID(id);

            return item;
        }

        [HttpPost]
        public IActionResult Modify([FromBody]Post item)
        {
            try
            {
               
                postRepository.AddOrUpdate(item);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.GetBaseException().Message);
            }
            return Ok(item);
        }


        public class LocationSearch
        {
            public float lat { get; set; }
            public float lng { get; set; }
            public int radius { get; set; }
        }

    }
}
