using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.Identity.Client;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace FlixnetBackend.Business
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions options) : base(options)
        {
            
        }
        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<MovieImage> MovieImages { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<User>().ToTable("Users");
            modelBuilder.Entity<Movie>().Property(Users => Users.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<Movie>().Property(Movies => Movies.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<MovieImage>().Property(MovieImages => MovieImages.ID).HasDefaultValueSql("NEWID()");

        }
    }
}
