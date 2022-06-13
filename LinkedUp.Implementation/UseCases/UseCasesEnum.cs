using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases
{
    public enum UseCasesEnum
    {
        EfRegisterUserCommand = 1,
        EfGetUsersQuery = 2,
        EfGetOneUserQuery = 3,
        
        EfDeleteUserCommand = 51,
        EfUpdateUserCommand = 52
    }
}
