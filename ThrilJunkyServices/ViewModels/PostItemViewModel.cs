using System;
using System.Collections.Generic;
using ThrilJunkyServices.Models;

namespace ThrilJunkyServices.ViewModels
{
    public class PostItemViewModel
    {
        public Media Media { get; set; }
        public Post Post { get; set; }
        public Location Location { get; set; }
        public int Likes { get; set; }
        public int Dislikes { get; set; }
        public string UserProfileImage { get; set; }
        public string Username { get; set; }
        public string Image { get; set; }
        public string Tags { get; set; }
        public string Created { get; set; }
    }
}
