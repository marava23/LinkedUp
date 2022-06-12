using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LinkedUp.API.Core
{
    public class AppSettings
    {
        public string ConnString { get; set; }
        public JwtSettings JwtSettings { get; set; }
        public EmailOptions EmailOptions { get; set; }
    }
}
