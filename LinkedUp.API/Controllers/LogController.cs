using LinkedUp.Application.Searches;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Implementation;
using Microsoft.AspNetCore.Authorization;
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
    public class LogController : ControllerBase
    {
        // GET: api/<LogController>
        [HttpGet]
        [Authorize]
        public IActionResult Get([FromServices]UseCaseHandler handler,
                                 [FromServices] ISearchLogsQuery query,
                                 [FromQuery] SearchLogsDto search)
        {
            return Ok(handler.HandleQuery(query, search));

        }

    }
}
