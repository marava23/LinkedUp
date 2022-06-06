using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Notification : Entity
    {
        public int Read { get; set; }
        public string Action { get; set; }
        public int UserId { get; set; }
        public int? ActionByUserId { get; set; }
        public virtual User User { get; set; }
        public virtual User ActionByUser { get; set; }
    }
}
