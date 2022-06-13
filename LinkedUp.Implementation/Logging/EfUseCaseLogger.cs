using LinkedUp.Application.Logging;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Logging
{
    public class EfUseCaseLogger : EfImplementation, IUseCaseLogger
    {
        public EfUseCaseLogger(LinkedUpContext context) : base(context)
        {
        }

        public void Log(UseCaseLog log)
        {
            _context.UseCaseLogs.Add(log);
            _context.SaveChanges();
        }
    }
}
