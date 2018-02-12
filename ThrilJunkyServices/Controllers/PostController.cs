using System;
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

        [HttpGet]

        public IActionResult GetAllByLocationOrderByCreatedDate(float lat, float lng, int radius)
        {
            return Ok(postRepository.GetAllByLocationOrderByCreatedDate(lat, lng, radius));
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
                if (item == null || !ModelState.IsValid)
                {
                    return BadRequest("Invalid State");
                }

                postRepository.AddOrUpdate(item);

            }
            catch (Exception)
            {
                return BadRequest("Error while creating");
            }
            return Ok(item);
        }

    }
}
