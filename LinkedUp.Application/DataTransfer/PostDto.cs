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
        public virtual ICollection<InteractionDto> Intercations { get; set; } = new List<InteractionDto>();
        public virtual ICollection<PostMediaDto> PostMedia { get; set; } = new List<PostMediaDto>();
    }
}
