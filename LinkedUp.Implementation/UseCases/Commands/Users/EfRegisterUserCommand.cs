using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases;
using LinkedUp.Application.UseCases.Users;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Users
{
    public class EfRegisterUserCommand : EfImplementation, ICreateUserCommand
    {
        private readonly IMapper _mapper;
        private readonly CreateUserValidator _validator;
        public EfRegisterUserCommand(LinkedUpContext context, IMapper mapper, CreateUserValidator validator) : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }


        public int Id => (int)UseCasesEnum.EfRegisterUserCommand;

        public string Name => "Ef register user command";

        public string Description => "";

        public void Execute(CreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _mapper.Map<User>(request);
            
            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}
