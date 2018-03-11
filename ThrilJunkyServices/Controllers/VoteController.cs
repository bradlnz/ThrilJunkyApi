using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
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
    public class VoteController : Controller
    {

        private readonly IVoteRepository voteRepository;
        private readonly IConfiguration config;

        public VoteController(IVoteRepository _voteRepository, IConfiguration _config)
        {
            voteRepository = _voteRepository;
            config = _config;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(voteRepository.GetAll());
        }

        [HttpGet("{Id}")]
        public Vote GetItem(int id, string userId)
        {
            Vote item = voteRepository.GetByID(id, userId);

            return item;
        }

        [HttpPost]
        public async Task<IActionResult> Modify([FromBody]Vote item)
        {
            try
            {
                var res = await voteRepository.Add(item);

                return Ok(res);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.GetBaseException().Message);
            }

        }

    }
}
