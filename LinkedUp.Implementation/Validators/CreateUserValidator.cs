using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Validators
{
    public class CreateUserValidator : AbstractValidator<CreateUserDto>
    {
        public CreateUserValidator(LinkedUpContext _context)
        {
            RuleFor(x => x.FirstName).NotEmpty().MinimumLength(3);
            RuleFor(x => x.LastName).NotEmpty().MinimumLength(3);
            RuleFor(x => x.Password).NotEmpty().MinimumLength(8);
            RuleFor(x => x.UserName).NotEmpty().MinimumLength(3)
                .Must(x => !_context.Users.Any(user => user.UserName == x))
                .WithMessage("Username is already taken.");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !_context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken.");
        }
    }
}
