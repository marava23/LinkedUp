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
        public string Image { get; set; }
        public virtual ICollection<PostDto> Posts { get; set; } = new List<PostDto>();
        public virtual ICollection<InteractionDto> Intercations { get; set; } = new List<InteractionDto>();
        public virtual ICollection<ConnectionDto> Conections { get; set; } = new List<ConnectionDto>();
        public virtual ICollection<UserUseCaseDto> UseCases { get; set; } = new List<UserUseCaseDto>();
    }
}
