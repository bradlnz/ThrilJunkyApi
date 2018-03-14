using System;
using System.Collections.Generic;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("ReportedItems")]
    [PrimaryKey("Id")]
    public class ReportedItem
    {
        public int Id { get; set; }

        public string UserId { get; set; }

        public int ReasonId { get; set; }

        public int MediaId { get; set; }

        public DateTime CreatedDate { get; set; }

    }
}
