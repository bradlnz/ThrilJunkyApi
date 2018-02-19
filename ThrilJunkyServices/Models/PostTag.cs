using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("PostTag")]
    [PrimaryKey("PostTagId")]
    public class PostTag
    {
        public int PostTagId { get; set; }

        public int TagId { get; set; }

       public int PostId { get; set; }

    }
}
