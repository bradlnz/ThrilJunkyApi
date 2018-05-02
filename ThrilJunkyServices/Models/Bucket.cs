using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Bucket")]
    [PrimaryKey("Id")]
    public class Bucket
    {
        public int Id { get; set; }

        public int? PostId { get; set; }

        public string UserId { get; set; }

        public DateTime? Created { get; set; }

        public bool? IsDeleted { get; set; } = false;
    }
}