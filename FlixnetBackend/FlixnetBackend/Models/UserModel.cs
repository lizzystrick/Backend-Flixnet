using FlixnetBackend.Business;
using System.ComponentModel.DataAnnotations;

namespace FlixnetBackend.Models
{
    public class UserModel
    {
        [Key][Required] public Guid ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public UserModel(Guid id, string username, string email, string password)
        {
            ID = id;
            UserName = username;
            Email = email;
            Password = password;
        }

        public UserModel(User user)
        {
            ID = user.ID;
            UserName = user.UserName;
            Email = user.Email;
            Password = user.Password;

        }

        public UserModel(Guid id, string email, string password)
        {
            ID = id;
            Email = email;
            Password = password;
        }
    }
}
