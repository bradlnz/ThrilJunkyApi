using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;

namespace ThrilJunkyServices.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    [Consumes("application/json")]
    public class UserController : Controller
    {

        private readonly IUserRepository userRepository;
        private readonly IConfiguration config;
        private readonly IMediaRepository mediaRepository;

        public UserController(IUserRepository _userRepository, IMediaRepository _mediaRepository, IConfiguration _config)
        {
            userRepository = _userRepository;
            mediaRepository = _mediaRepository;
            config = _config;
        }

        [HttpGet]
        public IActionResult List()
        {
            var users = userRepository.GetAll();

            foreach(var user in users){

                if(user.MediaId > 0){
                    var media = mediaRepository.GetByID(user.MediaId);

                    if (media != null)
                    {
                        user.MediaUrl = media.MediaUrl;
                    }     
                }
               
                   
            }

            return Ok(users);
        }

        [HttpGet("{username}")]
        public User GetItem(string username)
        {
            User item = userRepository.GetItem(username);

            if (item.MediaId > 0)
            {
                var media = mediaRepository.GetByID(item.MediaId);

                if (media != null)
                {
                    item.MediaUrl = media.MediaUrl;
                }
            }

            return item;
        }

        [HttpPost]
        public void Modify([FromBody]User item)
        {
            try
            {
                userRepository.Modify(item);
            }
            catch (Exception ex)
            {
           
            }

        }



    }
}
