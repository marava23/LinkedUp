using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class InteractionDto
    {
        public int SenderId { get; set; }
        public int RecieverId { get; set; }
        public int Status { get; set; }
    }
}
