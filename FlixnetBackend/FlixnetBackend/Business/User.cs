using System.ComponentModel.DataAnnotations;

namespace FlixnetBackend.Business
{
    public class User
    {
        [Key][Required] public Guid ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public User()
        {

        }
    }
}
