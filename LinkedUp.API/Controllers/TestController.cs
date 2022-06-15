using Bogus;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Extensions;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LinkedUp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {

        private readonly LinkedUpContext _context;

        public TestController(LinkedUpContext context)
        {
            _context = context;
        }
        // POST api/<TestController>
        [HttpPost]
        public IActionResult Post()
        {
            if (_context.Users.Count() > 2)
                return Conflict();
            var users = new List<User>();
            for (int i = 0; i < 15; i++)
            {
                var user = new Faker<User>()
                    .RuleFor(x => x.FirstName, x => x.Name.FirstName())
                    .RuleFor(x => x.LastName, x => x.Name.LastName())
                    .RuleFor(x => x.UserName, x => x.Person.UserName)
                    .RuleFor(x => x.Password, x => BCrypt.Net.BCrypt.HashPassword("Sifra123$"))
                    .RuleFor(x => x.IsAdmin, x => false)
                    .RuleFor(x => x.Email, x => x.Internet.ExampleEmail());

                users.Add(user);
            }
            _context.Users.AddRange(users);

            var posts = new List<Post>();
            for (int i = 0; i < 15; i++)
            {
                var post = new Faker<Post>()
                    .RuleFor(x => x.Content, x => x.Lorem.Paragraphs())
                    .RuleFor(x => x.Author, x => users.ElementAt(x.Random.Number(0, 14)));
                posts.Add(post);
            }
            _context.AddRange(posts);

            var interactions = new List<PostIntercation>();
            for (int i = 0; i < 40; i++)
            {
                var intercation = new Faker<PostIntercation>()
                    .RuleFor(x => x.Post, x => posts.ElementAt(x.Random.Number(0, 14)))
                    .RuleFor(x => x.Interaction, x => Interaction.Comment)
                    .RuleFor(x => x.Content, x => x.Lorem.Sentences())
                    .RuleFor(x => x.User, x => users.ElementAt(x.Random.Number(0, 14)));
                interactions.Add(intercation);
            }
            for (int i = 0; i < 20; i++)
            {
                var intercation = new Faker<PostIntercation>()
                    .RuleFor(x => x.Post, x => posts.ElementAt(x.Random.Number(0, 14)))
                    .RuleFor(x => x.Interaction, x => Interaction.Like)
                    .RuleFor(x => x.User, x => users.ElementAt(x.Random.Number(0, 14)));
                interactions.Add(intercation);
            }
            _context.Intercations.AddRange(interactions);

            var pictures = new List<Media>();
            for (int i = 0; i < 35; i++)
            {
                var picture = new Faker<Media>()
                    .RuleFor(x => x.MediaType, x => MediaType.Image)
                    .RuleFor(x => x.Path, x => Guid.NewGuid().ToString() + ".jpg")
                    .RuleFor(x => x.Size, x => x.Random.Number(100, 2000));
                pictures.Add(picture);
            }
            _context.AddRange(pictures);
            var pictures1 = _context.Media.ToList();
            var posts1 = _context.Posts.ToList();
            var postMedia = new List<PostMedia>();
            foreach (var picture in pictures)
            {
                var postmedia = new Faker<PostMedia>()
                    .RuleFor(x => x.Media, x => picture)
                    .RuleFor(x => x.Post, x => posts.ElementAt(x.Random.Number(0, 14)));
                postMedia.Add(postmedia);
            }
            _context.PostMedia.AddRange(postMedia);

            var allUsers = _context.Users.ToList();
            foreach (var user in allUsers)
            {
                user.AddDefaultUseCases();
            }
            var admin = _context.Users.Where(x => x.Id == 3).FirstOrDefault();
            admin.IsAdmin = true;
            var listaUseCasova = new List<UserUseCase>
            {
                new UserUseCase{UseCaseId = 6, UserId = 3 },
                new UserUseCase{UseCaseId = 52 , UserId = 3 },
                new UserUseCase{UseCaseId = 100, UserId = 3 },
                new UserUseCase{UseCaseId = 101, UserId = 3 },
                new UserUseCase{UseCaseId = 102, UserId = 3 },
            };
            _context.UserUseCases.AddRange(listaUseCasova);
            _context.SaveChanges();
            return Ok();
        }

    }
}
