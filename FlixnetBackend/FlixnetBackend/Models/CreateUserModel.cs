using System.ComponentModel.DataAnnotations;

namespace FlixnetBackend.Models
{
    public class CreateUserModel
    {
        [Key][Required] public Guid ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public CreateUserModel(Guid id, string username, string email, string password)
        {
            ID = id;
            UserName = username;
            Email = email;
            Password = password;
        }
    }
}
