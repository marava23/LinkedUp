using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class UseCaseLog
    {
        public int Id { get; set; }
        public string UseCaseName { get; set; }
        public string User { get; set; }
        public int UserId { get; set; }
        public DateTime ExecutionDateTime { get; set; }
        public string Data { get; set; }
        public int Duration { get; set; }
    }
}
