using LinkedUp.API.UploadFiles;
using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Commands.Posts;
using LinkedUp.Application.UseCases.Queries.Posts;
using LinkedUp.Domain;
using LinkedUp.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
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
    public class PostController : ControllerBase
    {
        private UseCaseHandler _handler;
        private readonly IUploadFile _uploadFile;

        public PostController(UseCaseHandler handler, IUploadFile uploadFile = null)
        {
            _handler = handler;
            _uploadFile = uploadFile;
        }
        // GET: api/<PostController>
        [HttpGet]
        public IActionResult Get([FromQuery] PostSearch search, [FromServices] IGetPostsQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices]IGetOnePostQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
           
        }

        // POST api/<PostController>
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromForm] CreatePostWithImageDto dto, [FromServices] ICreatePostCommand command)
        {
            if(dto.Images.Count() > 0)
            {
                try
                {
                    foreach (var picture in dto.Images)
                    {
                        var fileName = _uploadFile.Upload(picture);
                        dto.PostMedia.Add(new PostMediaDto
                        {
                            MediaType = MediaType.Image.ToString(),
                            Path = fileName,
                            CreatedAt = DateTime.UtcNow
                        });
                    }
                }
                catch(Exception ex)
                {
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }
                
            }
            var CastDto = new CreatePostDto
            {
                UserId = dto.UserId,
                Content = dto.Content,
                PostMedia = dto.PostMedia
            };
            _handler.HandleCommand(command, CastDto);
            return StatusCode(StatusCodes.Status201Created);
        }


        // DELETE api/<PostController>/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }

    public class CreatePostWithImageDto : CreatePostDto
    {
        public IEnumerable<IFormFile> Images { get; set; } = new List<IFormFile>();
    }
}
