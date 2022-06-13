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
        protected LinkedUpContext _context { get; }

        protected EfImplementation(LinkedUpContext context)
        {
            _context = context;
        }

    }
}
