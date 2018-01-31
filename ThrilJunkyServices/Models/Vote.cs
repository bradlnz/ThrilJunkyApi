using System;
using NPoco;

namespace ThrilJunkyServices.Models
{
    [TableName("Vote")]
    [PrimaryKey("VoteId")]
    public class Vote
    {
        public int VoteId { get; set; }

        //ie Upvote, Downvote
        public int VoteTypeId { get; set; }
        //ie Post, Hint
        public int VoteCategoryId { get; set; }

        public int UserId { get; set; }

        public int? HintId { get; set; }

        public int? PostId { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
