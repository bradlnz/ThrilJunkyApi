using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Location")]
    [PrimaryKey("LocationId")]
    public class Location
    {
        public int LocationId { get; set; }

        public int LocationTypeId { get; set; }

        public float Latitude { get; set; }

        public float Longitude { get; set; }

        public string Name { get; set; } 

        public string Address { get; set; }
    }
}
