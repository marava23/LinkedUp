using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation
{
    public abstract class EfImplementation
    {
        protected LinkedUpContext Context { get; }

        protected EfImplementation(LinkedUpContext context)
        {
            Context = context;
        }

    }
}
