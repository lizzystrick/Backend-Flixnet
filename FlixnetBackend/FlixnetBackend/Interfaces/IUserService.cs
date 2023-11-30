using FlixnetBackend.Business;
using FlixnetBackend.Models;

namespace FlixnetBackend.Interfaces
{
    public interface IUserService
    {
        UserModel GetUserByID(Guid userID);
        UserModel CreateUser(CreateUserModel user);
    }
}
