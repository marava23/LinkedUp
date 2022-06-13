using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class UserDto : BaseDto
    {
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int? MediaId { get; set; }
        public virtual ICollection<PostDto> Posts { get; set; } = new List<PostDto>();
       // public virtual ICollection<PostIntercation> Intercations { get; set; } = new List<PostIntercation>();
       // public virtual ICollection<Connection> Sended { get; set; } = new List<Connection>();
       // public virtual ICollection<Connection> Recieved { get; set; } = new List<Connection>();
       // public virtual ICollection<UserUseCase> UseCases { get; set; } = new List<UserUseCase>();
       // public virtual Media Media { get; set; }
    }
}
