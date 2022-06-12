using LinkedUp.Application.DataTransfer;
using LinkedUp.Application.UseCases;
using LinkedUp.Application.UseCases.Users;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Users
{
    public class EfRegisterUserCommand : EfImplementation, ICreateUserCommand
    {
        public EfRegisterUserCommand(LinkedUpContext context) : base(context)
        {
        }

        public int Id => 1;

        public string Name => "Ef register user command";

        public string Description => "";

        public void Execute(CreateUserDto request)
        {
                Context.Users.Add(new Domain.User {
                     Email = request.Email,
                     FirstName = request.FirstName,
                     LastName = request.LastName,
                     UserName = request.UserName,
                     Password = request.Password
                });
            Context.SaveChanges();
        }
    }
}
