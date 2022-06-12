using LinkedUp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.Logging
{
    public interface IUseCaseLogger
    {
        void Log(UseCaseLog log);
    }
   
}
