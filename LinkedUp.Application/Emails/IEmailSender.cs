using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.Emails
{
    public interface IEmailSender
    {
        void Send(MailMessage message);
    }
}
