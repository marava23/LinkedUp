using LinkedUp.Domain;
using LinkedUp.Implementation.UseCases;
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
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfContactAdminCommand },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfCreateInteractionCommand },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfCreatePostCommand },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfCreateProfilePictureCommand },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfDeleteInteractionCommand },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfGetUsersQuery },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfGetOneUserQuery },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfGetPostsQuery },
                new UserUseCase{ UseCaseId = (int)UseCasesEnum.EfGetOnePostQuery },

                
            };
            user.UseCases = useCases;
        }
    }
}
