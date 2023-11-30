using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace FlixnetBackend.Repositories
{
    public class MovieRepository : DbContext, IMovieRepository
    {
        public MovieRepository(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }

        public DbSet<Movie> Movies { get; set; }
        public void SaveMovies(List<Movie> movies)
        {
            Movies.AddRange(movies);
            SaveChanges();
        }

    }
}
