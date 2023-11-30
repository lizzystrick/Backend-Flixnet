using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace FlixnetBackend.Repositories
{
    public class UserRepository : DBContext, IUserRepository
    {
        public UserRepository(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }

        public User GetUser(Guid userID)
        {
            User user = Users.Find(userID);
            if (user == null)
            {
                throw new Exception("User not found");
            }
            return user;
        }

        public User GetUserByID(Guid userID)
        {
            User user = Users.Where(x => x.ID == userID).FirstOrDefault();
            if (user == null)
            {
                throw new Exception("User not found");
            }
            return user;
        }
        public User CreateUser(User userEntity)
        {
            Users.Add(userEntity);
            Save();
            return userEntity;
        }

        public void Save()
        {
            SaveChanges(true);
        }

        public void Save(bool acceptChangesOnSuccess)
        {
            SaveChanges(acceptChangesOnSuccess);
        }
    }
}
