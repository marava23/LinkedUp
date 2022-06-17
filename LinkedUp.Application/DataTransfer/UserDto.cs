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
        public virtual ICollection<PostShortDto> Posts { get; set; } = new List<PostShortDto>();

    }
    
    public class OneUserDto : UserDto
    {
        public virtual ICollection<InteractionDto> Intercations { get; set; } = new List<InteractionDto>();
        public virtual ICollection<UserUseCaseDto> UseCases { get; set; } = new List<UserUseCaseDto>();
    }

    public class PostShortDto : BaseDto
    {
        public string Content { get; set; }
        public int? PostId { get; set; }
        public int UserId { get; set; }
        public string Author { get; set; }
    }
}
