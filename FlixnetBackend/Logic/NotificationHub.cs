
using Microsoft.AspNetCore.SignalR;

namespace FlixnetBackend.Logic
{
    public class NotificationHub : Hub
    {
        public async Task LikeMovie(int movieId)
        {
            // Call the ReceiveLikeNotification method to update clients.
            await Clients.Others.SendAsync("ReceiveLikeNotification", movieId);
        }
    }
}
