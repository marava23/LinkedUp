using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class PostDto : BaseDto
    {
        public string Content { get; set; }
        public int? PostId { get; set; }
        public int UserId { get; set; }
        public string Author { get; set; }
        //public virtual ICollection<PostIntercation> Intercations { get; set; } = new List<PostIntercation>();
        //public virtual ICollection<PostMedia> PostMedia { get; set; } = new List<PostMedia>();
    }
}
