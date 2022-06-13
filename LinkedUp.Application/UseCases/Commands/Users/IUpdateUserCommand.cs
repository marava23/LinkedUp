using LinkedUp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.UseCases.Commands.Users
{
    public interface IUpdateUserCommand : ICommand<CreateUserDto>
    {
    }
}
