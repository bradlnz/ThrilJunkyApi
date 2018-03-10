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

        public UserController(IUserRepository _userRepository, IConfiguration _config)
        {
            userRepository = _userRepository;
            config = _config;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(userRepository.GetAll());
        }

        [HttpGet("{username}")]
        public User GetItem(string username)
        {
            User item = userRepository.GetItem(username);

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
