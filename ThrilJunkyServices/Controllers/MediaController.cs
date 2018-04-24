using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading;
using Azure.MediaServices.Core.Assets;
using Azure.MediaServices.Core;
using System.Threading.Tasks;

namespace ThrilJunkyServices.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    [Consumes("application/json", "application/json-patch+json", "multipart/form-data")]
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

                mediaRepository.Add(item);

            }
            catch (Exception)
            {
                return BadRequest("Error while creating");
            }
            return Ok(item);
        }

        [HttpPost("UploadMedia")]
        public async Task<Media> UploadMedia(IFormFile file)
      {
            string extension = string.Empty;
            string fileName = file.FileName;
            int fileExtPos = fileName.LastIndexOf(".", StringComparison.Ordinal) + 1;
            extension = fileName.Substring(fileExtPos, fileName.Length - fileExtPos);
     
         

            var media = await mediaRepository.Upload(config["ConnectionStrings:BucketName"],
                                                     $"{DateTime.Now.ToString("ddMMyyyyHHMMss")}.{extension}", extension, file);

            return media;
        }
     

    }
}
