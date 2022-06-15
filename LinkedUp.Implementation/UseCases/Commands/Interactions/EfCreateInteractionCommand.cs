using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Commands.Interaction;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Interactions
{
    public class EfCreateInteractionCommand : EfGenericInsert<CreateInteractionDto, PostIntercation>, ICreateInteractionCommand
    {
        public EfCreateInteractionCommand(LinkedUpContext context, IMapper mapper, CreateInteractionValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreateInteractionCommand;
        public override string Name => "Ef create interaction command";

        public override string Description => "";
    }
}
