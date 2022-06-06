using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Topic : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public virtual ICollection<PostTopic> Posts { get; set; } = new List<PostTopic>();
        public virtual ICollection<UserInterest> Users { get; set; } = new List<UserInterest>();
        public virtual ICollection<CategoryTopic> CategoryTopics { get; set; } = new List<CategoryTopic>();
    }
}
