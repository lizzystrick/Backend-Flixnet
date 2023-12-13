using FlixnetBackend.Business;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace FlixnetBackend.Models
{
    public class MovieModel
    {
        public Guid ID { get; set; }
        public string Title { get; set; }
        public string Overview { get; set; }
        public string ImageUrl { get; set; }
        public int GenreId { get; set; }

        public MovieModel(Guid id, string title, string description, string images, int genreId)
        {
            ID = id;
            Title = title;
            Overview = description;
            ImageUrl = images;
            GenreId = genreId;  
        }

        public MovieModel(Movie movie)
        {
            ID = movie.ID;
            Title = movie.Title;
            Overview = movie.Overview;
            ImageUrl = movie.ImageUrl;
            GenreId = movie.GenreId;
        }
    }
}
