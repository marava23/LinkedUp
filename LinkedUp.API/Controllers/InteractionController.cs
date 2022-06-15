using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases.Commands.Interaction;
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
    public class InteractionController : ControllerBase
    {
        private UseCaseHandler _handler;

        public InteractionController(UseCaseHandler handler)
        {
            _handler = handler;
        }
        // POST api/<InteractionController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] CreateInteractionDto dto, [FromServices] ICreateInteractionCommand command)
        {
            _handler.HandleCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);
        }

        // DELETE api/<InteractionController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices]IDeleteInteractionCommand command)
        {
            _handler.HandleCommand(command, id);
            return NoContent();
        }
    }
}
