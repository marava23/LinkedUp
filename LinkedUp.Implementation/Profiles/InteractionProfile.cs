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
            CreateMap<PostIntercation, InteractionDto>();
            CreateMap<InteractionDto, PostIntercation>();
        }
    }
}
