using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("LocationType")]
    [PrimaryKey("LocationTypeId")]
    public class LocationType
    {
        public int LocationTypeId { get; set; }

        //Place, Landmark, etc.
        public string Type { get; set; }
    }
}
