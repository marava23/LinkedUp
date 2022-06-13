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
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<UserUseCaseDto, UserUseCase>();
            CreateMap<UserUseCase, UserUseCaseDto>();
        }
    }
}
