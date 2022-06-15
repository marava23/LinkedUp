using AutoMapper;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Profiles
{
    public class InteractionProfile : Profile
    {
        public InteractionProfile()
        {
            CreateMap<PostIntercation, InteractionDto>()
                .ForMember(x => x.Author, x => x.MapFrom(y => y.User.UserName))
                .ForMember(x => x.InteractionType, x => x.MapFrom(y => y.Interaction.ToString()));
            CreateMap<InteractionDto, PostIntercation>();
            CreateMap<CreateInteractionDto, PostIntercation>()
                .ForMember(x=> x.Interaction, x=> x.MapFrom(y=> y.InteractionType));
            CreateMap<PostIntercation, CreateInteractionDto>()
                .ForMember(x=> x.InteractionType, x=> x.MapFrom(y=> y.Interaction));
        }
    }
}
