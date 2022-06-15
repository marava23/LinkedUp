using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
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
    public abstract class EfGenericInsert<TDto, TEntity> : ICommand<TDto>
        where TDto : BaseDto
        where TEntity : Entity
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        public abstract string Description { get; }

        private LinkedUpContext _context;
        private IMapper _mapper;
        private AbstractValidator<TDto> _validator;

        protected EfGenericInsert(LinkedUpContext context, IMapper mapper, AbstractValidator<TDto> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(TDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Set<TEntity>().Add(_mapper.Map<TEntity>(request));
            _context.SaveChanges();
        }
    }
}
