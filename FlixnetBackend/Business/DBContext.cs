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
        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<MovieImage> MovieImages { get; set; }
        public DbSet<LikedMovie> LikedMovies { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<User>().Property(Users => Users.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<Movie>().Property(Movies => Movies.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<Movie>().Property(Movies => Movies.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<MovieImage>().Property(MovieImages => MovieImages.ID).HasDefaultValueSql("NEWID()");
            modelBuilder.Entity<User>()
        .HasMany(u => u.LikedMovies)
        .WithOne(lm => lm.User)
        .HasForeignKey(lm => lm.UserId);


        }
    }
}
