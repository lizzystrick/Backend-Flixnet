using FlixnetBackend.Business;

namespace FlixnetBackend.Interfaces
{
    public interface ILikedMovieRepository
    {
        Task<IEnumerable<LikedMovie>> GetLikedMoviesByUser(Guid userId);
        Task LikeMovie(LikedMovie likedMovie);
        Task<bool> DeleteLikedMovieAsync(Guid userId, string movieId);
    }
}
