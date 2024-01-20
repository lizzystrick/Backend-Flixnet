using FlixnetBackend.Business;

namespace FlixnetBackend.Interfaces
{
    public interface IUserRepository
    {
        User GetUser(Guid userID);
        User GetUserByEmail(string email);
        Task<string> GetUserNameById(Guid userId);
        User CreateUser(User userEntity);
        Task UpdateUserAsync(User user);
        Task<User> GetUserByIdAsync(Guid id);
        //Task<Guid> GetUserId(string email);
    }
}
