using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System.Security.Claims;
using backend.Application.Contracts.Infrastructure.Services;
using backend.Application.Contracts.Persistence;

namespace backend.WebApi.Controllers.RealTime
{
    [Authorize]
    public class ChatHub(ICacheService cacheService, IUnitOfWork unitOfWork) : Hub
    {
        public override async Task OnConnectedAsync()
        {
            if (Context.User.Identity != null && Context.User.Identity.IsAuthenticated)
            {
                var userId = Context.User.FindFirstValue(ClaimTypes.NameIdentifier);
                var user = await unitOfWork.UserRepository.GetById(id: userId);
                await cacheService.AddToSet(userId, Context.ConnectionId);
                await cacheService.Add($"{userId}-data", SterilizeUserMessage(user));
                await base.OnConnectedAsync();
            } 
        }
        
        public async Task BroadcastToUser(string userId, string message)
        {
            var connectionIds = await cacheService.GetSetMembers(userId);
            foreach (var connectionId in connectionIds)
            {
                await Clients.Client(connectionId).SendAsync("ReceiveMessage", message);
            }
        }
    
        public override async Task OnDisconnectedAsync(Exception exception)
        {
            Console.WriteLine($"Connection {Context.ConnectionId} disconnected");
            if (Context.User.Identity != null && Context.User.Identity.IsAuthenticated)
            {
                var userId = Context.User.FindFirstValue(ClaimTypes.NameIdentifier);
                await cacheService.RemoveFromSet(userId, Context.ConnectionId);
                await cacheService.Remove($"{userId}-data");
            }
            await base.OnDisconnectedAsync(exception);
        }
        
        private object SterilizeUserMessage(Domain.Entities.User.User user) 
        {
            var sterilizedUser = new 
            {
                id = user.Id,
                firstName = user.FirstName,
                lastName = user.LastName,
                profilePicture = user.ProfilePicture,
            };
            return sterilizedUser;
        }
    }
}