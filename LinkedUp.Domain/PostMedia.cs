using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class PostMedia
    {
        public int PostId { get; set; }
        public int MediaId { get; set; }
        public virtual Media Media { get; set; }
        public virtual Post Post { get; set; }
    }
}
