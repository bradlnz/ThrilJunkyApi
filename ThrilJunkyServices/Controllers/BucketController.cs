using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using static ThrilJunkyServices.Controllers.PostController;

namespace ThrilJunkyServices.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    public class BucketController : Controller
    {

        private readonly IPostRepository postRepository;
        private readonly IMediaRepository mediaRepository;
        private readonly IUserRepository userRepository;
        private readonly ILocationRepository locationRepository;
        private readonly IVoteRepository voteRepository;
        private readonly IReportingRepository reportingRepository;

        public BucketController(IPostRepository _postRepository, IMediaRepository _mediaRepository, IUserRepository _userRepository, ILocationRepository _locationRepository, IVoteRepository _voteRepository, IReportingRepository _reportingRepository)
        {
            postRepository = _postRepository;
            mediaRepository = _mediaRepository;
            userRepository = _userRepository;
            locationRepository = _locationRepository;
            voteRepository = _voteRepository;
            reportingRepository = _reportingRepository;
        }


        [HttpPost]
        public IActionResult Modify([FromBody]Bucket item)
        {
            try
            {
                if (item.PostId.HasValue)
                {
                    Bucket bucket = postRepository.GetBucketById(item.PostId.Value, item.UserId).FirstOrDefault();

                    if (bucket != null)
                    {
                        item.Id = bucket.Id;
                        item.Created = bucket.Created;
                    }

                    postRepository.AddOrUpdateBucket(item);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.GetBaseException().Message);
            }
            return Ok(item);
        }

        [HttpPost]
        [Route("GetAllByUserId")]
        public IActionResult GetAllByUserId([FromBody] UserSearch item)
        {
            var items = postRepository.GetAllByUserIdBucket(item.userId).Where(v => v.IsDeleted == false);

            foreach (var it in items)
            {
                var media = mediaRepository.GetByID(it.MediaId);

                it.MediaUrl = media.MediaUrl;

                var user = userRepository.GetAll().FirstOrDefault(a => a.Id == it.UserId);

                if (user != null)
                    it.Username = user.UserName;

                var loc = locationRepository.GetAll().FirstOrDefault(a => a.LocationId == it.LocationId);

                if (loc != null)
                    it.Name = loc.Name;
            }


            return Ok(items.OrderByDescending(x => x.CreatedDate));
        }
    }

}
