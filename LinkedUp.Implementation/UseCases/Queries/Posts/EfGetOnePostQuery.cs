using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Queries.Posts;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.UseCases.Queries.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries.Posts
{
    public class EfGetOnePostQuery : EfGenericGetSingle<Post, PostDto>, IGetOnePostQuery
    {
        public EfGetOnePostQuery(LinkedUpContext context, IMapper mapper, IApplicationUser user) : base(context, mapper, user)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOnePostQuery;

        public override string Name => "Ef get one post";

        public override string Description => "";
    }
}
