using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Domain.Entities.Common;
using backend.Persistence.Configuration;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Common;

public class ChatRepository(StyleHubDBContext context): GenericRepository<Chat>(context), IChatRepository
{
    public async Task<IReadOnlyList<Chat>> GetAll(string senderId, string receiverId, int skip, int take)
    {
        var chats = await context.Chats
            .Include(u => u.Sender)
            .Include(u => u.Receiver)
            .Where(u => u.Sender.Id == senderId || u.Receiver.Id == senderId || u.Sender.Id == receiverId || u.Receiver.Id == receiverId)
            .OrderByDescending(u => u.CreatedAt)
            .Skip(skip)
            .Take(take)
            .ToListAsync();
        return chats!;
    }

    public async Task<Chat> GetById(string id)
    {
        var chat = await context.Chats
            .Include(u => u.Sender)
            .Include(u => u.Receiver)
            .FirstOrDefaultAsync(u => u.Id == id);
        return chat!;
    }

    public async Task<IReadOnlyList<Domain.Entities.User.User>> GetUsersChat(string userId, int skip, int take)
    {


        return [];
    }
}

