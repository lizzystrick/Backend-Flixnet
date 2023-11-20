using FlixnetBackend.Business;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace FlixnetBackend.Models
{
    public class MovieModel
    {
        public Guid ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public List<string> Images { get; set; }

        public MovieModel(Guid id, string title, string description, List<string> images)
        {
            ID = id;
            Title = title;
            Description = description;
            Images = images;
        }
    }
}
