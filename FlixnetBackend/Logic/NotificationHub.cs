
using Microsoft.AspNetCore.SignalR;

namespace FlixnetBackend.Logic
{
    public class NotificationHub : Hub
    {
        public async Task LikeMovie(int movieId)
        {
            await Clients.Others.SendAsync("ReceiveLikeNotification", movieId);
        }
    }
}
