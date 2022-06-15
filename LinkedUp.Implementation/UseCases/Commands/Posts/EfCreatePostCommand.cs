using AutoMapper;
using FluentValidation;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Commands.Posts;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands.Posts
{
    public class EfCreatePostCommand : EfImplementation, ICreatePostCommand
    {
        private IMapper _mapper;
        private CreatePostValidator _validator;

        public EfCreatePostCommand(LinkedUpContext context, IMapper mapper, CreatePostValidator validator) : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfCreatePostCommand;

        public string Name => "Ef create post command";

        public string Description => "";

        public void Execute(CreatePostDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = new Post
            {
                Content = request.Content,
                UserId = request.UserId,
            };
            var media = request.PostMedia.Select(x => new Media
            {
                Path = x.Path,
                MediaType = MediaType.Image
            }).ToList();
            _context.Posts.Add(post);
            _context.Media.AddRange(media);
            _context.SaveChanges();
        }
    }
}
