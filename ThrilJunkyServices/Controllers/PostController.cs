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
        private readonly IMediaRepository mediaRepository;
        private readonly IUserRepository userRepository;

        public PostController(IPostRepository _postRepository, IMediaRepository _mediaRepository, IUserRepository _userRepository)
        {
            postRepository = _postRepository;
            mediaRepository = _mediaRepository;
            userRepository = _userRepository;
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
            var items = postRepository.GetAllByLocationOrderByCreatedDate(item.lat, item.lng, item.radius);

            foreach(var it in items)
            {
               var media = mediaRepository.GetByID(it.MediaId);

                it.MediaUrl = media.MediaUrl;

                var user = userRepository.GetAll().FirstOrDefault(a => a.Id == it.UserId);

                if(user != null)
                it.Username = user.Username;

             
            }

            var ret = from val in items
                      orderby val.CreatedDate descending
                      group val by val.LocationId into g
                      select g.Take(5).OrderByDescending(b => b.CreatedDate).ToList();

            return Ok(ret);
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
