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
    public class TagController : Controller
    {

        private readonly ITagRepository tagRepository;
        private  readonly IConfiguration config;
        
        public TagController(ITagRepository _tagRepository, IConfiguration _config)
        {
            tagRepository = _tagRepository;
            config = _config;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(tagRepository.GetAll());
        }

        [HttpGet("{Id}")]
        public Tag GetItem(int id)
        {
            Tag item = tagRepository.GetByID(id);

            return item;
        }

        [HttpPost]
        public IActionResult Modify([FromBody]Tag item)
        {
            try
            {
                if (item == null || !ModelState.IsValid)
                {
                    return BadRequest("Invalid State");
                }

                tagRepository.Add(item);

            }
            catch (Exception)
            {
                return BadRequest("Error while creating");
            }
            return Ok(item);
        }
    }
}
