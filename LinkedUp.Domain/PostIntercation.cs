using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class PostIntercation : Entity
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public int UserId { get; set; }
        public Interaction Interaction { get; set; }
        public int? PostIntercationId { get; set; }
        public string Content { get; set; }
        public virtual User User { get; set; }
        public virtual Post Post { get; set; }
        public virtual PostIntercation ParentIntercation { get; set; }
        public virtual ICollection<PostIntercation> ChildrenInteractions { get; set; } = new List<PostIntercation>();
    }

    public enum Interaction
    {
        Like,
        Dislike,
        Comment,
        Share,
        Follow,
        Seen
    }
}
