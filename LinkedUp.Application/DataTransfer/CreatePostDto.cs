using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class CreatePostDto
    {
        public string Content { get; set; }
        public int UserId { get; set; }
        public virtual ICollection<PostMediaDto> PostMedia { get; set; } = new List<PostMediaDto>();

    }
}
