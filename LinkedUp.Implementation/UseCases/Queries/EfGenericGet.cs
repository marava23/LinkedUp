using AutoMapper;
using Doublel.QueryableBuilder;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries
{
    public abstract class EfGenericGet<TSearch, T, TDto> : IQuery<PaginatedResponse<TDto>, TSearch>
        where T : Entity
        where TDto : BaseDto
        where TSearch : PageSearch
    {
        private LinkedUpContext _context;
        private IMapper _mapper;
        private IApplicationUser _user;

        protected EfGenericGet(LinkedUpContext context, IMapper mapper, IApplicationUser user)
        {
            _context = context;
            _mapper = mapper;
            _user = user;
        }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public abstract string Description { get; }

        public PaginatedResponse<TDto> Execute(TSearch search)
        {
            var query = _context.Set<T>().AsQueryable();
            query = query.BuildQuery(search);
            if (!_user.IsAdmin)
            {
                query = query.OnlyActive();
            }
            else
            {
                query = query.NotDeleted();
            }
            return query.Paged<TDto, T>(search, _mapper);
        }
    }
}
