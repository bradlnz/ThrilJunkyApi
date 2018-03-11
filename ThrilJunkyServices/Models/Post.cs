﻿using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Post")]
    [PrimaryKey("PostId")]
    public class Post
    {
        public int PostId { get; set; }

        //Reference to User
        public string UserId { get; set; }

        //Reference to Location
        public int LocationId { get; set; }

        //Reference to Media
        public int MediaId { get; set; }

        public string PostText { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime LastUpdatedDate { get; set; }

        //check if flagged - Set by ADMIN
        public bool? IsFlagged { get; set; }

        [Ignore]
        public string MediaUrl { get; set; }

        [Ignore]
        public string Username { get; set; }
        [Ignore]
        public string Name { get; set; }

        [Ignore]
        public string UserProfileImageUrl { get; set; }
    }
}
