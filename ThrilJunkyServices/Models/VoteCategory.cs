using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("VoteCategory")]
    [PrimaryKey("VoteCategoryId")]
    public class VoteCategory
    {
        public int VoteCategoryId { get; set; }

        public string Category { get; set; }
    }
}
