using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries
{
    public class EfGetUsersQuery : EfGenericGet<UserSearch, User, UserDto>, IGetUsersQuery
    {
        public EfGetUsersQuery(LinkedUpContext context, IMapper mapper, IApplicationUser user) : base(context, mapper, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetUsersQuery;

        public override string Name => "Ef get users";

        public override string Description => throw new NotImplementedException();
    }
}
