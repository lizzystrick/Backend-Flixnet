using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Repositories;
using Microsoft.AspNetCore.SignalR;

namespace FlixnetBackend.Logic
{
    public class LikedMovieService : ILikedMovieService
    {
        private readonly ILikedMovieRepository _repository;
        private readonly IHubContext<NotificationHub> _hubContext;

        public LikedMovieService(ILikedMovieRepository repository, IHubContext<NotificationHub> hubContext)
        {
            _repository = repository;
            _hubContext = hubContext;
        }

        public async Task LikeMovie(Guid userId, string movieId)
        {
            var likedMovie = new LikedMovie
            {
                UserId = userId,
                MovieId = movieId,
                LikedOn = DateTime.UtcNow
            };

            await _hubContext.Clients.All.SendAsync("ReceiveLikeNotification", $"Movie {movieId} was liked by user {userId}");
        }

        public async Task<IEnumerable<LikedMovie>> GetLikedMoviesByUser(Guid userId)
        {
            return await _repository.GetLikedMoviesByUser(userId);
        }
    }
}
