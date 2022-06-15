using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.Searches
{
    public class SearchLogsDto : PageSearch
    {
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        public string Keyword { get; set; }
    }
}
