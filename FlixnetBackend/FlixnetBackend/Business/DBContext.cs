using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.Identity.Client;

namespace FlixnetBackend.Business
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions options) : base(options)
        {
            
        }

        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<MovieImage> MovieImages { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Movie>().Property(Movies => Movies.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<MovieImage>().Property(MovieImages => MovieImages.ID).HasDefaultValueSql("NEWID()");

            modelBuilder.Entity<MovieImage>()
                .HasOne(i => i.Movie)
                .WithMany(c => c.Images)
                .HasForeignKey(i => i.MovieID);
        }
    }
}
