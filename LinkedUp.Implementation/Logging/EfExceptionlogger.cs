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
    public class EfExceptionlogger : EfImplementation, IExceptionLogger
    {
        public EfExceptionlogger(LinkedUpContext context) : base(context)
        {
        }

        public void Log(Exception ex)
        {
            Context.ExceptionLogs.Add(new ExceptionLog 
            {
                Exception = ex.Message,
                ExceptionDateTime = DateTime.UtcNow
            });
            Context.SaveChanges();
        }
    }
}
