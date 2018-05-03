using System;
using System.Collections.Generic;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Hint")]
    [PrimaryKey("HintId")]
    public class Hint
    {
        public int HintId { get; set; }

        public string UserId { get; set; }

        public int PostId { get; set; }

        public string HintValue { get; set; }

        public DateTime CreatedDate { get; set; }

        [Ignore]
        public string Username { get; set; }

        [Ignore]
        public string MediaUrl { get; set; }

        [Ignore]
        public int VoteTypeId { get; set; }

        [Ignore]
        public List<Vote> Likes { get; set; }

        [Ignore]
        public List<Vote> Dislikes { get; set; }

        [Ignore]
        public int HintColor { get; set; }
    }
}
