using backend.Application.DTO.User.UserDTO.DTO;

namespace backend.Application.DTO.Common.Chat.DTO;

public class ChatResponseDTO
{
    public required string Id { get; set; }
    public required string Message { get; set; }
    public required string Type { get; set; }
    public required UserChatResponseDTO Sender { get; set; }
    public required UserChatResponseDTO Receiver { get; set; }
    public required DateTime CreatedAt { get; set; }
}