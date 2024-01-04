using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace FlixnetBackend.Business
{
    public class User 
    {
        [Key][Required] public Guid ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public ICollection<LikedMovie> LikedMovies { get; set; }

        public User()
        {

        }
    }
}
