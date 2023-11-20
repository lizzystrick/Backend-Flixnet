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
    }
}
