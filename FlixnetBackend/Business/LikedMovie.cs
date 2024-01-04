using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace FlixnetBackend.Business
{
    public class LikedMovie
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; } // Adjust based on your User identifier type
        public string MovieId { get; set; } // TMDB Movie ID
        public DateTime LikedOn { get; set; }
        public User User { get; set; }
    }
}
