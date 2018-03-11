using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;

namespace ThrilJunkyServices.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    [Consumes("application/json")]
    public class HintController : Controller
    {

        private readonly IHintRepository hintRepository;
        private readonly IUserRepository userRepository;
        private readonly IMediaRepository mediaRepository;

        private  readonly IConfiguration config;
        
        public HintController(IHintRepository _hintRepository, IUserRepository _userRepository, IMediaRepository _mediaRepository, IConfiguration _config)
        {
            hintRepository = _hintRepository;
            userRepository = _userRepository;
            mediaRepository = _mediaRepository;
            config = _config;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(hintRepository.GetAll());
        }

        [HttpGet("{Id}")]
        public Hint GetItem(int id)
        {
            Hint item = hintRepository.GetByID(id);

            return item;
        }

        [HttpGet]
        [Route("GetAllByPostId")]
        public List<Hint> GetAllByPostId(int id)
        {
           var posts = hintRepository.GetAllByPostId(id);

            foreach(var post in posts)
            {
                var user = userRepository.GetAll().FirstOrDefault();

                post.Username = user.UserName;

                if(user.MediaId > 0){
                    
                    var media = mediaRepository.GetByID(user.MediaId);

                    post.MediaUrl = media.MediaUrl;     
                }
               
               
            }

            return posts;
        }

        [HttpPost]
        public IActionResult Modify([FromBody]Hint item)
        {
            try
            {
               
                hintRepository.Add(item);

            }
            catch (Exception)
            {
                return BadRequest("Error while creating");
            }
            return Ok(item);
        }
    }
}
