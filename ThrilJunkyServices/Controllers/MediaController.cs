using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using Microsoft.AspNetCore.Http.Internal.FormFile;
namespace ThrilJunkyServices.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    public class MediaController : Controller
    {

        private readonly IMediaRepository mediaRepository;
        private  readonly IConfiguration config;
        
        public MediaController(IMediaRepository _mediaRepository, IConfiguration _config)
        {
            mediaRepository = _mediaRepository;
            config = _config;
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
      public string UploadMedia(IFormFile file)
      {
        return mediaRepository.Upload(config["ConnectionStrings:Blob"], config["BlobContainer"], $"{DateTime.Now}.mp4", file);
      }
    }
}
