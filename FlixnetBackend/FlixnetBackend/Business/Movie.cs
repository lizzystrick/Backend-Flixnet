using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace FlixnetBackend.Business
{
    public class Movie
    {
        [Key][Required] public Guid ID { get; set; }
        [Required] public string Title { get; set; }
        public string Description { get; set; }
        public virtual ICollection<MovieImage> Images { get; set; }
    }
}
