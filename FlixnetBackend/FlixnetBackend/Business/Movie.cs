using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace FlixnetBackend.Business
{
    public class Movie
    {
        [Key][Required] public Guid ID { get; set; }
        [Required] public string Title { get; set; }
        public string Overview { get; set; }
        public string ImageUrl { get; set; }
        public int GenreId { get; set; } 

        public Movie()
        {

        }
    }
}
