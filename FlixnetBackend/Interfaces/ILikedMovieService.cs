using FlixnetBackend.Business;

namespace FlixnetBackend.Interfaces
{
    public interface ILikedMovieService
    {
        Task LikeMovie(Guid userId, string movieId);
        Task<IEnumerable<LikedMovie>> GetLikedMoviesByUser(Guid userId);
        Task<bool> DeleteLikedMovieAsync(Guid userId, string movieId);
    }
}
