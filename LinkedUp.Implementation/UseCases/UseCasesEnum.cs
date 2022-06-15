using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases
{
    public enum UseCasesEnum
    {
        EfRegisterUserCommand = 1,
        EfGetUsersQuery = 2,
        EfGetOneUserQuery = 3,
        EfGetPostsQuery = 4,
        EfGetOnePostQuery = 5,
        EfGetConnectionsQuery = 6,

        EfDeleteUserCommand = 51,
        EfUpdateUserCommand = 52,
        EfCreatePostCommand = 53,
        EfDeletePostCommand = 54,
        EfCreateProfilePictureCommand = 60,
        EfCreateInteractionCommand = 61,
        EfDeleteInteractionCommand = 62,
        EfContactAdminCommand = 63,

        EfUpdateUserUseCase = 100,
        EfGetUseCaseLogsQuery = 101,
        EfGetUseCaseLogQuery = 102
    }
}
