using AutoMapper;
using AutoMapper.QueryableExtensions;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Extensions
{
    public static class QueryableExtensions
    {
        public static PaginatedResponse<TDto> Paged<TDto, TEntity>
            (this IQueryable<TEntity> query, PageSearch search, IMapper mapper)
            where TEntity : Entity
            where TDto : BaseDto
        {
            var skipCount = search.PerPage * (search.Page - 1);
            var skipped = query.Skip(skipCount).Take(search.PerPage);
            var response = new PaginatedResponse<TDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = skipped.ProjectTo<TDto>(mapper.ConfigurationProvider).ToList()
            };
            return response;
        }

        public static IQueryable<T> OnlyActive<T> (this IQueryable<T> query) where T : Entity
        {
            query = query.Where(x => x.IsActive == true);
            query = query.Where(x => x.DeletedAt == null);
            return query;
        }

        public static IQueryable<T> NotDeleted<T>(this IQueryable<T> query) where T : Entity
        {
            query = query.Where(x => x.DeletedAt == null);
            return query;
        }
    }
}
