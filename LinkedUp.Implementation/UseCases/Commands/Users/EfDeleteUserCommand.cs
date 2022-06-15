using LinkedUp.Application.UseCases.Commands.Users;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Users
{
    public class EfDeleteUserCommand : EfGenericDelete<User>, IDeleteUserCommand
    {
        public EfDeleteUserCommand(LinkedUpContext context, IApplicationUser user) : base(context, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteUserCommand;

        public override string Name => "EfDelete user command";

        public override string Description => "";
    }
}
