using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Vote")]
    [PrimaryKey("ID")]
    public class Vote
    {
        
        public int ID { get; set; }
        //ie Upvote, Downvote
        public int VoteTypeId { get; set; }
        //ie Post, Hint
        public int VoteCategoryId { get; set; }

        public string UserId { get; set; }

        public int? HintId { get; set; }

        public int? PostId { get; set; }

        public DateTime CreatedDate { get; set; }

        [Ignore]
        public Media UserProfileImage { get; set; }
    }
}
