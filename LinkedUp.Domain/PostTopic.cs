using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class PostTopic
    {
        public int PostId { get; set; }
        public int TopicId { get; set; }
        public virtual Post Post { get; set; }
        public virtual Topic Topic { get; set; }

    }
}
