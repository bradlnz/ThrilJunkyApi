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
        private readonly ILocationRepository locationRepository;
        private readonly IVoteRepository voteRepository;
        private readonly IReportingRepository reportingRepository;

        public PostController(IPostRepository _postRepository, IMediaRepository _mediaRepository, IUserRepository _userRepository, ILocationRepository _locationRepository, IVoteRepository _voteRepository, IReportingRepository _reportingRepository)
        {
            postRepository = _postRepository;
            mediaRepository = _mediaRepository;
            userRepository = _userRepository;
            locationRepository = _locationRepository;
            voteRepository = _voteRepository;
            reportingRepository = _reportingRepository;
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
            var items = postRepository.GetAllByLocationOrderByCreatedDate(item.lat, item.lng, item.radius).Where(v => v.IsDeleted == false);

            foreach(var it in items)
            {
               var media = mediaRepository.GetByID(it.MediaId);

                it.MediaUrl = media.MediaUrl;

                var user = userRepository.GetById(it.UserId);


                if(user != null)
                it.Username = user.UserName;

                if (user.MediaId > 0)
                {
                    var media1 = mediaRepository.GetByID(user.MediaId);

                    if (media1 != null)
                    {
                        it.UserProfileImageUrl = media1.MediaUrl;
                    }
                }

                var vote = voteRepository.GetByID(it.PostId, item.UserId);

                if(vote != null)
                {
                    it.VoteTypeId = vote.VoteTypeId;
                }

                it.Votes = voteRepository.GetAll().Where(a => a.PostId == it.PostId && a.VoteTypeId == 1).ToList();
              
                if(it.Votes.Any(a => a.VoteTypeId == 1))
                {
                    foreach (var v in it.Votes){
                        if (user.MediaId > 0)
                        {
                            var u = userRepository.GetById(v.UserId);
                            if (u != null && u.MediaId > 0){

                            v.UserProfileImage = mediaRepository.GetByID(u.MediaId);
                            } 
                            if(u.MediaId <= 0){
                                v.UserProfileImage = new Media
                                {
                                    MediaTypeId = 1,
                                    MediaUrl = "https://thriljunkystorage.blob.core.windows.net/public/avatar-large.png"
                                };
                            }
                        }
                    }
                }

                it.ReportedItems = reportingRepository.GetAllByPostId(it.PostId);

                var loc = locationRepository.GetByID(it.LocationId);
                
                if(loc != null){
                    it.Name = loc.Name;
                    it.Latitude = loc.Latitude;
                    it.Longitude = loc.Longitude;
                }
        
            }

            var ret = from val in items
                      orderby val.CreatedDate descending
                      group val by val.LocationId into g
                      select g.Take(5).OrderByDescending(b => b.CreatedDate).ToList();

            return Ok(ret);
        }

        [HttpPost]
        [Route("GetAllByUserId")]
        public IActionResult GetAllByUserId([FromBody] UserSearch item)
        {
            var items = postRepository.GetAllByUserId(item.userId).Where(v => v.IsDeleted == false);

            foreach(var it in items)
            {
                if (it.MediaId > 0)
                {
                    var media = mediaRepository.GetByID(it.MediaId);

                    if (media != null)
                        it.MediaUrl = media.MediaUrl;

                    var user = userRepository.GetAll().FirstOrDefault(a => a.Id == it.UserId);

                    if (user != null)
                        it.Username = user.UserName;

                    var loc = locationRepository.GetAll().FirstOrDefault(a => a.LocationId == it.LocationId);

                    if (loc != null)
                        it.Name = loc.Name;
                } 

                if(it.MediaUrl == null)
                {
                    it.MediaUrl = string.Empty;
                }
            }

          
            return Ok(items.OrderByDescending(x =>x.CreatedDate));
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

     

        [HttpPost]
        [Route("ReportItem")]
        public IActionResult ReportItem([FromBody]ReportedItem item)
        {
            try
            {

                reportingRepository.Add(item);

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
            public string UserId { get; set; }
        }
        
        public class UserSearch {
            public string userId { get; set; }
        }

    }
}
