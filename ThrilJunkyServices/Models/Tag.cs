using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Tag")]
    [PrimaryKey("TagId")]
    public class Tag
    {
        public int TagId { get; set; }

        public string Text { get; set; }

        public DateTime CreatedDate { get; set; }

    }
}
