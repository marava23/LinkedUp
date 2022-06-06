using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Media : Entity
    {
        public MediaType MediaType { get; set; }
        public string Path { get; set; }
        public double Size { get; set; }
        public int PostId { get; set; }
        public virtual ICollection<PostMedia> PostMedia { get; set; } = new List<PostMedia>();
        public virtual User User { get; set; }

    }
    public enum MediaType
    {
        Image,
        Video,
        GIF
    }
}
