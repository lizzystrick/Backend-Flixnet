using FlixnetBackend.Business;
using FlixnetBackend.Models;

namespace FlixnetBackend.Interfaces
{
    public interface IUserService
    {
        Task<string> GetUserNameById(Guid userId);
        User GetUserByEmail(string email);
        UserModel CreateUser(CreateUserModel user);
        bool ValidateUser(LoginModel model);
        Task UpdateUserAsync(UpdateUserModel model);

    }
}
