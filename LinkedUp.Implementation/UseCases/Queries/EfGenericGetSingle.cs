using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Exceptions;
using LinkedUp.Application.UseCases;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Queries.Users
{
    public abstract class EfGenericGetSingle<T, TDto> : IQuery<TDto, int>
        where T : Entity
        where TDto : BaseDto
    {
        private readonly LinkedUpContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationUser _user;

        protected EfGenericGetSingle(LinkedUpContext context, IMapper mapper, IApplicationUser user)
        {
            _context = context;
            _mapper = mapper;
            _user = user;
        }

        public abstract int Id { get; }

        public abstract string Name { get; }
        public abstract string Description { get; }

        public TDto Execute(int id)
        {
            var row = _context.Set<T>().FirstOrDefault(x => x.Id == id);

            if (row == null)
            {
                throw new EntityNotFoundException(id, typeof(T));
            }

            if ((row.IsActive == false && !_user.IsAdmin) || (row.DeletedAt!= null))
            {
                throw new EntityNotFoundException(id, typeof(T));
            }

            return _mapper.Map<TDto>(row);
        }
    }
}
