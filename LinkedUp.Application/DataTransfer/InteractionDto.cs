using LinkedUp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.DataTransfer
{
    public class InteractionDto : BaseDto
    {
        public int PostId { get; set; }
        public string Author { get; set; }
        public string Content { get; set; }
        public string InteractionType { get; set; }
    }
    public class CreateInteractionDto : BaseDto
    {
        public int PostId { get; set; }
        public int UserId { get; set; }
        public string Content { get; set; }
        public Interaction InteractionType { get; set; }
    }
}
