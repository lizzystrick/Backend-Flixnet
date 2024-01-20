using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace FlixnetBackend.Business
{
    public class LikedMovie
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; } 
        public string MovieId { get; set; } 
        public DateTime LikedOn { get; set; }
        public User User { get; set; }
    }
}
