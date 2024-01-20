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
        private readonly IUserService _userService; // Add user service to get username

        public LikedMovieService(ILikedMovieRepository repository, IHubContext<NotificationHub> hubContext,
            IUserService userService)
        {
            _repository = repository;
            _hubContext = hubContext;
            _userService = userService;
        }

        public async Task<bool> DeleteLikedMovieAsync(Guid userId, string movieId)
        {
            return await _repository.DeleteLikedMovieAsync(userId, movieId);
        }

        public async Task LikeMovie(Guid userId, string movieId)
        {
            
            var likedMovie = new LikedMovie
            {
                UserId = userId,
                MovieId = movieId,
                LikedOn = DateTime.UtcNow
            };
            await _repository.LikeMovie(likedMovie);
            var userName = await _userService.GetUserNameById(userId);
            // Save the like action to the database
            

            // Notify other users that a movie has been liked
            await _hubContext.Clients.All.SendAsync("ReceiveLikeNotification", new {userId, movieId, userName});
        }

        public async Task<IEnumerable<LikedMovie>> GetLikedMoviesByUser(Guid userId)
        {
            return await _repository.GetLikedMoviesByUser(userId);
        }
    }
}
