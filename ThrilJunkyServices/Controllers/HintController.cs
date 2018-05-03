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
        private readonly IVoteRepository voteRepository;

        private  readonly IConfiguration config;
        
        public HintController(IHintRepository _hintRepository, IUserRepository _userRepository, IMediaRepository _mediaRepository, IVoteRepository _voteRepository, IConfiguration _config)
        {
            hintRepository = _hintRepository;
            userRepository = _userRepository;
            mediaRepository = _mediaRepository;
            voteRepository = _voteRepository;
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
        public List<Hint> GetAllByPostId(int id, string userId)
        {
            var posts = hintRepository.GetAllByPostId(id).OrderBy(a => a.Likes?.Count());

            foreach(var post in posts)
            {
                var user = userRepository.GetAll().FirstOrDefault(a => a.Id == post.UserId);

                post.Username = user.UserName;

                if(user.MediaId > 0){
                    
                    var media = mediaRepository.GetByID(user.MediaId);

                    post.MediaUrl = media.MediaUrl;     
                }
                var vote = voteRepository.GetAll().Where(a => a.HintId == post.HintId).FirstOrDefault();

                if(vote != null){
                    post.VoteTypeId = vote.VoteTypeId;
                }
                post.Likes = voteRepository.GetAll().Where(a => a.VoteTypeId == 1 && a.HintId == post.HintId).ToList();

                post.Dislikes = voteRepository.GetAll().Where(a => a.VoteTypeId == 2 && a.HintId == post.HintId).ToList();

                var vote2 = voteRepository.GetAll().Where(a => a.HintId == post.HintId && a.UserId == userId).FirstOrDefault();

                if(vote2 != null)
                post.HintColor = vote2.VoteTypeId;
            }

            return posts.ToList();
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
