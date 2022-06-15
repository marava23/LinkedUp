using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries
{
    public class EfSearchLogsQuery : EfImplementation, ISearchLogsQuery
    {
        public EfSearchLogsQuery(LinkedUpContext context) : base(context)
        {
        }

        public int Id => (int)UseCasesEnum.EfGetUseCaseLogsQuery;

        public string Name => "Ef search logs";

        public string Description => "";

        public PaginatedResponse<UseCaseLogsDto> Execute(SearchLogsDto search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) && !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.User.ToLower().Contains(search.Keyword.ToLower()) ||
                x.UseCaseName.ToLower().Contains(search.Keyword.ToLower()));
            }

            if (search.From.HasValue)
            {
                query = query.Where(x => x.ExecutionDateTime >= search.From);
            }
            if (search.To.HasValue)
            {
                query = query.Where(x => x.ExecutionDateTime <= search.To);
            }
            var skipCount = search.PerPage * (search.Page - 1);

            return new PaginatedResponse<UseCaseLogsDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(log =>
                new UseCaseLogsDto
                {
                    Data = log.Data,
                    Duration = log.Duration,
                    ExecutionDateTime = log.ExecutionDateTime,
                    UseCaseName = log.UseCaseName,
                    User = log.User
                })
            };
        }
    }
}
