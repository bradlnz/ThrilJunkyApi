using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Media")]
    [PrimaryKey("MediaId")]
    public class Media
    {
        public int MediaId { get; set; }

        //Reference to Media Type 
        public int MediaTypeId { get; set; }

        public string MediaUrl { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
