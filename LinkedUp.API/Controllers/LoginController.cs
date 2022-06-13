using LinkedUp.API.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LinkedUp.API.Controllers
{
        [Route("api/[controller]")]
        [ApiController]
        public class LoginController : ControllerBase
        {
            private readonly JwtManager _manager;

            public LoginController(JwtManager manager)
            {
                _manager = manager;
            }

            [HttpPost]
            [AllowAnonymous]
            public IActionResult Post([FromBody] TokenRequest request)
            {
                try
                {
                    var token = _manager.MakeToken(request.Email, request.Password);

                    return Ok(new { token });
                }
                catch (UnauthorizedAccessException)
                {
                    return Unauthorized();
                }
                catch (System.Exception)
                {
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }
            }
        }

        public class TokenRequest
        {
            public string Email { get; set; }
            public string Password { get; set; }
        }
}
