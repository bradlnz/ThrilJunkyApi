using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Tag")]
    [PrimaryKey("TagId")]
    public class Tag
    {
        public int TagId { get; set; }

        public int? LocationId { get; set; }

        public int PostId { get; set; }

        public string TagValue { get; set; }

    }
}
