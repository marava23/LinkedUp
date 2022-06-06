using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Post : Entity
    {
        public string Content { get; set; }
        public int? PostId { get; set; }
        public int UserId { get; set; }
        public virtual User Author { get; set; }
        public virtual ICollection<PostIntercation> Intercations { get; set; } = new List<PostIntercation>();
        public virtual ICollection<PostTopic> Topics { get; set; } = new List<PostTopic>();
        public virtual ICollection<PostMedia> PostMedia { get; set; } = new List<PostMedia>();
    }
}
