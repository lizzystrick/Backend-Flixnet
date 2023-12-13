using FlixnetBackend.Business;

namespace FlixnetBackend.Interfaces
{
    public interface IUserRepository
    {
        User GetUser(Guid userID);
        User GetUserByEmail(string email);
        User CreateUser(User userEntity);
        //Task<Guid> GetUserId(string email);
    }
}
