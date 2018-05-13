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
using System.Collections.Generic;

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
        ITagRepository _tagRepository;

        public HomeController(IPostRepository postRepository, IMediaRepository mediaRepository, 
                              ILocationRepository locationRepository, IVoteRepository voteRepostory, IUserRepository userRepository, ITagRepository tagRepository){
            _postRepository = postRepository;
            _mediaRepository = mediaRepository;
            _locationRepository = locationRepository;
            _voteRepository = voteRepostory;
            _userRepository = userRepository;
            _tagRepository = tagRepository;
        }


        [HttpGet]
        [Route("{id}")]
        public ActionResult Index(int id)
        {
            var post = _postRepository.GetByID(id);


            var postTags = _tagRepository.GetAllPostTags().Where(a => a.PostId == post.PostId);

            var tags = new List<string>();

            if (postTags.Any())
            {
                foreach (var tag in postTags)
                {
                    var t = _tagRepository.GetByID(tag.TagId);

                    if (t != null)
                    {
                        tags.Add(t.Text.Replace("#", ""));
                    }

                }
            }

            var media = _mediaRepository.GetByID(post.MediaId);
            
            var location = _locationRepository.GetByID(post.LocationId);

            var votes = _voteRepository.GetAll().Where(a => a.PostId == post.PostId);

            var user = _userRepository.GetById(post.UserId);

            var userMedia = _mediaRepository.GetByID(user.MediaId);

            string joined = string.Join(", ", tags);

            joined = joined.Replace("#", "");

            var model = new PostItemViewModel
            {
                Post = post,
                Tags = joined,
                Media = media,
                Location = location,
                Likes = votes.Count(a => a.VoteCategoryId == 1),
                Dislikes = votes.Count(a => a.VoteCategoryId == 2),
                Username = user.UserName,
                UserProfileImage = $"https://{userMedia.MediaUrl}",
                Image = $"https://{media.MediaUrl.Replace(".mp4", ".jpg")}",
                Created = TimeAgo(post.CreatedDate)
            };

            return View(model);
        }


        public string TimeAgo(DateTime dt)
        {
            if (dt > DateTime.Now)
                return "about sometime from now";
            TimeSpan span = DateTime.Now - dt;

            if (span.Days > 365)
            {
                int years = (span.Days / 365);
                if (span.Days % 365 != 0)
                    years += 1;
                return String.Format("about {0} {1} ago", years, years == 1 ? "year" : "years");
            }

            if (span.Days > 30)
            {
                int months = (span.Days / 30);
                if (span.Days % 31 != 0)
                    months += 1;
                return String.Format("about {0} {1} ago", months, months == 1 ? "month" : "months");
            }

            if (span.Days > 0)
                return String.Format("about {0} {1} ago", span.Days, span.Days == 1 ? "day" : "days");

            if (span.Hours > 0)
                return String.Format("about {0} {1} ago", span.Hours, span.Hours == 1 ? "hour" : "hours");

            if (span.Minutes > 0)
                return String.Format("about {0} {1} ago", span.Minutes, span.Minutes == 1 ? "minute" : "minutes");

            if (span.Seconds > 5)
                return String.Format("about {0} seconds ago", span.Seconds);

            if (span.Seconds <= 5)
                return "just now";

            return string.Empty;
        }
    }
}
