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
    public class CreatePostValidator : AbstractValidator<CreatePostDto>
    {
        public CreatePostValidator(LinkedUpContext context)
        {
           
            RuleFor(x => x.Content).NotEmpty().WithMessage("Post content is required.");


            RuleFor(x => x.UserId).NotEmpty().WithMessage("User is required.")
                    .Must(x => context.Users.Any(u => u.Id == x))
                    .WithMessage("Provided user doesn't exist.");

        }

    }
}
