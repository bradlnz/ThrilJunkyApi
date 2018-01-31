using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("MediaType")]
    [PrimaryKey("MediaTypeId")]
    public class MediaType
    {
        public int MediaTypeId { get; set; }

        public string Type { get; set; }
    }
}
