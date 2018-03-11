using System;
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
    }
}
