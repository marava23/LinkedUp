using LinkedUp.Domain;
using LinkedUp.Implementation.UseCases;
using System.Collections.Generic;

namespace LinkedUp.API.Core
{
    public class AnonimousUser : IApplicationUser
    {
        public string Identity => "Anonymous";

        public int Id => 0;

        public IEnumerable<int> UseCaseIds => new List<int> 
        {
            (int)UseCasesEnum.EfRegisterUserCommand,
            (int)UseCasesEnum.EfGetUsersQuery,
            (int)UseCasesEnum.EfGetOneUserQuery
        };

        public string Email => "anonimous@asp-api.com";

        public bool IsAdmin => false;
    }
}
