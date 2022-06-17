using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Emails;
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
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(LinkedUpContext context, IMapper mapper, CreateUserValidator validator, IEmailSender sender) : base(context)
        {
            _mapper = mapper;
            _validator = validator;
            _sender = sender;
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

            
           /* _sender.Send(new MessageDto
            {
                To = request.Email,
                Title = "Successfull registration!",
                Body = "Dear " + request.UserName + "\n Please activate your account...."
            });*/
        }
    }
}
