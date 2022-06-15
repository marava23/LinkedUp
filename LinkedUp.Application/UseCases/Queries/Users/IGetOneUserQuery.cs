using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.UseCases.Queries
{
    public interface IGetOneUserQuery : IQuery<UserDto, int>
    {
    }
}
