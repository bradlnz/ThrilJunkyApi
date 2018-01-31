using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("VoteType")]
    [PrimaryKey("VoteTypeId")]
    public class VoteType
    {
        public int VoteTypeId { get; set; }

        public string Type { get; set; }
    }
}
