using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class ExceptionLog
    {
        public int Id { get; set; }
        public string ExceptionType { get; set; }
        public string Exception { get; set; }
        public DateTime ExceptionDateTime { get; set; }

    }
}
