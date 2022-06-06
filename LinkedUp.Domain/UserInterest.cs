using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class UserInterest
    {
        public int UserId { get; set; }
        public int TopicId { get; set; }
        public virtual User User { get; set; }
        public virtual Topic Topic { get; set; }
    }
}
