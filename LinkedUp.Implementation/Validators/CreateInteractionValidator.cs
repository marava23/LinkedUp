using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Validators
{
    public class CreateInteractionValidator : AbstractValidator<CreateInteractionDto>
    {
        public CreateInteractionValidator(LinkedUpContext context)
        {
            RuleFor(x => x.PostId).NotEmpty().WithMessage("You must enter post id")
                .Must(x => context.Posts.Any(post => post.Id == x)).WithMessage("This post doesn't exist");
            RuleFor(x => x.UserId).NotEmpty().WithMessage("User is required.")
                .Must(x => context.Users.Any(u => u.Id == x))
                .WithMessage("Provided user doesn't exist.");
            RuleFor(x => x.InteractionType).NotEmpty();
            RuleFor(x => x.InteractionType).IsInEnum();
        }
    }
}
