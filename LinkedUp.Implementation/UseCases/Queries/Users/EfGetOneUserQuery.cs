using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.UseCases.Queries.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries
{
    public class EfGetOneUserQuery : EfGenericGetSingle<User, OneUserDto>, IGetOneUserQuery
    {
        public EfGetOneUserQuery(LinkedUpContext context, IMapper mapper, IApplicationUser user) : base(context, mapper, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneUserQuery;

        public override string Name => "Ef get one user query";

        public override string Description => "";
    }
}
