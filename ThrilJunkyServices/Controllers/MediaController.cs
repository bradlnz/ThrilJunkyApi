using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;

namespace ThrilJunkyServices.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    public class MediaController : Controller
    {

        private readonly IMediaRepository mediaRepository;

        public MediaController(IMediaRepository _mediaRepository)
        {
            mediaRepository = _mediaRepository;
        }

        [HttpGet]

        public IActionResult List()
        {
            return Ok(mediaRepository.GetAll());
        }

        [HttpGet("{Id}")]
        public Media GetItem(int id)
        {
            Media item = mediaRepository.GetByID(id);

            return item;
        }

        [HttpPost]
        public IActionResult Modify([FromBody]Media item)
        {
            try
            {
                if (item == null || !ModelState.IsValid)
                {
                    return BadRequest("Invalid State");
                }

                mediaRepository.AddOrUpdate(item);

            }
            catch (Exception)
            {
                return BadRequest("Error while creating");
            }
            return Ok(item);
        }

      [HttpPost]
      public string UploadMedia(HttpPostedFileBase file)
      {
        return mediaRepository.Upload(_config["ConnectionStrings:Blob"], _config["BlobContainer"], $"{DateTime.Now}.mp4", file);
      }
    }
}
