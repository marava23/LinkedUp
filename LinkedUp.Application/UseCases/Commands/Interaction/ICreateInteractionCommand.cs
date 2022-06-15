using LinkedUp.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.UseCases.Commands.Interaction
{
    public interface ICreateInteractionCommand : ICommand<CreateInteractionDto>
    {
    }
}
