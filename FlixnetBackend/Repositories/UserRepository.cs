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

        public async Task<string> GetUserNameById(Guid userId)
        {
            var user = await Users.FindAsync(userId);
            return user?.UserName;
        }

        public async Task UpdateUserAsync(User user)
        {
            Users.Update(user);
            await SaveChangesAsync();
        }

        public async Task<User> GetUserByIdAsync(Guid id)
        {
            return await Users.FindAsync(id);
        }

        public User GetUserByEmail(string email)
        {
            User user = null;
            try
            {
                user = Users.FirstOrDefault(x => x.Email == email);
                if (user == null)
                {
                    Console.WriteLine("Gebruiker niet gevonden");
                }
                else
                {
                    Console.WriteLine($"Gebruiker gevonden: {user.ID}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Er is een fout opgetreden: {ex.Message}");
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
