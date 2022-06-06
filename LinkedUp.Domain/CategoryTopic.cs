using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class CategoryTopic
    {
        public int CategoryId { get; set; }
        public int TopicId { get; set; }
        public virtual Category Category { get; set; }
        public virtual Topic Topic { get; set; }
    }
}
