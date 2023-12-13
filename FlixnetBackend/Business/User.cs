using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace FlixnetBackend.Business
{
    public class User : IdentityUser<Guid>
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
