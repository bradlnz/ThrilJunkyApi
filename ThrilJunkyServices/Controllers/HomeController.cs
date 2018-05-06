using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using ThrilJunkyServices.ViewModels;
using System.Linq;
using System.IO;

namespace ThrilJunkyServices.Controllers
{
  
    [Route("[controller]")]
    public class HomeController : Controller
    {
        IPostRepository _postRepository;
        IMediaRepository _mediaRepository;
        ILocationRepository _locationRepository;
        IVoteRepository _voteRepository;
        IUserRepository _userRepository;
        public HomeController(IPostRepository postRepository, IMediaRepository mediaRepository, 
                              ILocationRepository locationRepository, IVoteRepository voteRepostory, IUserRepository userRepository){
            _postRepository = postRepository;
            _mediaRepository = mediaRepository;
            _locationRepository = locationRepository;
            _voteRepository = voteRepostory;
            _userRepository = userRepository;
        }


        [HttpGet]
        [Route("{id}")]
        public ActionResult Index(int id)
        {
            var post = _postRepository.GetByID(id);

            var media = _mediaRepository.GetByID(post.MediaId);
            
            var location = _locationRepository.GetByID(post.LocationId);

            var votes = _voteRepository.GetAll().Where(a => a.PostId == post.PostId);

            var user = _userRepository.GetById(post.UserId);

            var userMedia = _mediaRepository.GetByID(user.MediaId);



            var model = new PostItemViewModel
            {
                Post = post,
                Media = media,
                Location = location,
                Likes = votes.Count(a => a.VoteCategoryId == 1),
                Dislikes = votes.Count(a => a.VoteCategoryId == 2),
                Username = user.UserName,
                UserProfileImage = $"https://{userMedia.MediaUrl}",
                Image = $"https://{media.MediaUrl.Replace(".mp4", ".jpg")}"
            };

            return View(model);
        }

       

    }
}
