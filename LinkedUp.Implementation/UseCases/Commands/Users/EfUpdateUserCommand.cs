using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Commands.Users;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Users
{
    public class EfUpdateUserCommand : EfGenericUpdate<CreateUserDto, User>, IUpdateUserCommand
    {
        public EfUpdateUserCommand(LinkedUpContext context, IMapper mapper, UpdateUserValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdateUserCommand;

        public override string Name => "Ef update user";

        public override string Description => "";
    }
}
