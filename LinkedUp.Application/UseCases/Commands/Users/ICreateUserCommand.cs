using LinkedUp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.UseCases.Users
{
    public interface ICreateUserCommand : ICommand<CreateUserDto>
    {
    }
}
