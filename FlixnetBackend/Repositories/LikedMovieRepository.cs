using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FlixnetBackend.Repositories
{
    public class LikedMovieRepository : ILikedMovieRepository
    {
        private readonly DBContext _context;

        public LikedMovieRepository(DBContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<LikedMovie>> GetLikedMoviesByUser(Guid userId)
        {
            return await _context.LikedMovies.Where(lm => lm.UserId == userId).ToListAsync();
        }

        public async Task LikeMovie(LikedMovie likedMovie)
        {
            _context.LikedMovies.Add(likedMovie);
            await _context.SaveChangesAsync();
        }
    }
}
