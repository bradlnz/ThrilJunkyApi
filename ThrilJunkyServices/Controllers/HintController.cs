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
    public class HintController : Controller
    {

        private readonly IHintRepository hintRepository;
        private  readonly IConfiguration config;
        
        public HintController(IHintRepository _hintRepository, IConfiguration _config)
        {
            hintRepository = _hintRepository;
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

        [HttpPost]
        public IActionResult Modify([FromBody]Hint item)
        {
            try
            {
                if (item == null || !ModelState.IsValid)
                {
                    return BadRequest("Invalid State");
                }

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
