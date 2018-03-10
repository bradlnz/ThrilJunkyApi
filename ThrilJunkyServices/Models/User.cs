using System;
using Microsoft.AspNetCore.Identity;
using NPoco;

namespace ThrilJunkyServices.Models
{
    public class User : IdentityUser 
    {
        public int MediaId { get; set; }
    }
}
