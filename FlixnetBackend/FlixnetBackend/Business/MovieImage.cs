using System.ComponentModel.DataAnnotations;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace FlixnetBackend.Business
{
    public class MovieImage
    {
        [Key][Required] public Guid ID { get; set; }
        [Required] public string ImageUrl { get; set; }
        public Guid MovieID { get; set; }
        [Required] public virtual Movie Movie { get; set; }
        public MovieImage(string imageUrl, Guid movieID)
        {
            ImageUrl = imageUrl;
            MovieID = movieID;
        }
    }
}
