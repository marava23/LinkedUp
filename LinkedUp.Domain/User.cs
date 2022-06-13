using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class User : Entity
    {
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int? MediaId { get; set; }
        public bool IsAdmin { get; set; }
        public virtual ICollection<Post> Posts { get; set; } = new List<Post>();
        public virtual ICollection<PostIntercation> Intercations { get; set; } = new List<PostIntercation>();
        public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();
        public virtual ICollection<Notification> Actions { get; set; } = new List<Notification>();
        public virtual ICollection<Connection> Sended { get; set; } = new List<Connection>();
        public virtual ICollection<Connection> Recieved { get; set; } = new List<Connection>();
        public virtual ICollection<UserInterest> Interests { get; set; } = new List<UserInterest>();
        public virtual ICollection<UserUseCase> UseCases { get; set; } = new List<UserUseCase>();
        public virtual Media Media { get; set; }

    }
}
