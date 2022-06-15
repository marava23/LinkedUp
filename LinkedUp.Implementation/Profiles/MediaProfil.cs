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
    public class MediaProfil : Profile
    {
        public MediaProfil()
        {
            CreateMap<PostMedia, PostMediaDto>()
                .ForMember(x => x.Path, x => x.MapFrom(y => y.Media.Path))
                .ForMember(x => x.MediaType, x => x.MapFrom(y => y.Media.MediaType.ToString()))
                .ForMember(x=> x.Id, x=> x.MapFrom(y=> y.Media.Id));
            CreateMap<PostMediaDto, PostMedia>();
        }
    }
}
