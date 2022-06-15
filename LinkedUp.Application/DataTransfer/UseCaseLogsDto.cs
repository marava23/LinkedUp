using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class UseCaseLogsDto : BaseDto
    {
        public string UseCaseName { get; set; }
        public string User { get; set; }
        public DateTime ExecutionDateTime { get; set; }
        public int Duration { get; set; }
        public string Data { get; set; }
    }
}
