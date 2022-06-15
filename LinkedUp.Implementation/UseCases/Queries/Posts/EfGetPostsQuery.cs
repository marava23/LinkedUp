using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Application.UseCases.Queries.Posts;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries.Posts
{
    public class EfGetPostsQuery : EfImplementation, IGetPostsQuery
    {
        private IMapper _mapper;
        private IApplicationUser _user;
        public EfGetPostsQuery(LinkedUpContext context, IMapper mapper, IApplicationUser user) : base(context)
        {
            _mapper = mapper;
            _user = user;
        }

        public int Id => (int)UseCasesEnum.EfGetOnePostQuery;

        public string Name => "Ef Get one post query";

        public string Description => "";

        public PaginatedResponse<PostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.OnlyActive().AsQueryable() ;

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                query = query.Where(x => x.Author.UserName.ToLower().Contains(search.Keyword.ToLower()));
            }
            return query.Paged<PostDto, Post>(search, _mapper);
        }
    }
}
