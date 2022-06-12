using LinkedUp.Domain;
using System.Collections.Generic;

namespace LinkedUp.API.Core
{
    public class AnonimousUser : IApplicationUser
    {
        public string Identity => "Anonymous";

        public int Id => 0;

        public IEnumerable<int> UseCaseIds => new List<int> { 4 };

        public string Email => "anonimous@asp-api.com";
    }
}
