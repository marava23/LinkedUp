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
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Post, PostDto>()
                .ForMember(x=> x.Author, x=> x.MapFrom(x=> x.Author.UserName));
            CreateMap<PostDto, Post>();
            CreateMap<CreatePostDto, Post>();
            CreateMap<Post, CreatePostDto>();
        }
    }
}
