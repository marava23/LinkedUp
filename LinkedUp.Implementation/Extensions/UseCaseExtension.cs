using LinkedUp.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.Extensions
{
    public static class UseCaseExtension
    {
        public static void AddDefaultUseCases(this User user)
        {
            var useCases = new List<UserUseCase>
            {
                
            };
            user.UseCases = useCases;
        }
    }
}
