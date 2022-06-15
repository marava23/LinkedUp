using LinkedUp.Application.UseCases.Commands.Posts;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Posts
{
    public class EfDeletePostCommand : EfGenericDelete<Post>, IDeletePostCommand
    {
        public EfDeletePostCommand(LinkedUpContext context, IApplicationUser user) : base(context, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeletePostCommand;

        public override string Name => "Ef delete post command";

        public override string Description => "";
    }
}
