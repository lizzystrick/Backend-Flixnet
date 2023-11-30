using FlixnetBackend.Business;

namespace FlixnetBackend.Interfaces
{
    public interface IUserRepository
    {
        User GetUser(Guid userID);
        User GetUserByID(Guid userID);
        User CreateUser(User userEntity);
    }
}
