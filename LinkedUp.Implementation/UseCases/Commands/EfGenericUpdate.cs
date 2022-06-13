using AutoMapper;
using FluentValidation;
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

namespace LinkedUp.Implementation.UseCases.Commands
{
    public abstract class EfGenericUpdate<TDto, TEntity> : ICommand<TDto>
        where TEntity : Entity
        where TDto : BaseDto
    {
        public abstract int Id { get; }

        public abstract string Name { get;  }

        public abstract string Description { get; }

        private LinkedUpContext _context;
        private IMapper _mapper;
        private AbstractValidator<TDto> _validator;

        protected EfGenericUpdate(LinkedUpContext context, IMapper mapper, AbstractValidator<TDto> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(TDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = _context.Set<TEntity>().Find(request.Id);

            if (item is null)
            {
                throw new EntityNotFoundException(request.Id, request.GetType());
            }

            _mapper.Map(request, item);
            _context.SaveChanges();
        }
    }
}
