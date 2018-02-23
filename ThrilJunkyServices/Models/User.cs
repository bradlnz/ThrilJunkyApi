using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    public class User
    {
        public string Id { get; set; }

        public int MediaId { get; set; }

        public string Username { get; set; }

        public string Firstname { get; set; }

        public string Lastname { get; set; }

        public string Email { get; set; }

        public string Quote { get; set; }

        public string LocationId { get; set; }
    }
}
