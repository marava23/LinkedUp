using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Connection : Entity
    {
        public int SenderId { get; set; }
        public int RecieverId { get; set; }
        public int Status { get; set; }
        public virtual User Sender { get; set; }
        public virtual User Reciever { get; set; }

    }
}
