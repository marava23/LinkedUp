using LinkedUp.Application.UseCases.Commands.Interaction;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Interactions
{
    public class EfDeleteInteractionCommand : EfGenericDelete<PostIntercation>, IDeleteInteractionCommand
    {
        public EfDeleteInteractionCommand(LinkedUpContext context, IApplicationUser user) : base(context, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteInteractionCommand;

        public override string Name => "Ef delete interaction command";
        public override string Description => "";
    }
}
