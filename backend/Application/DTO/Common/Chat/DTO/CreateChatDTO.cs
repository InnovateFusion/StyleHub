namespace backend.Application.DTO.Common.Chat.DTO;
public class CreateChatDTO
{
    public required string Message { get; set; }
    public required string Type { get; set; }
    public required string ReceiverId { get; set; }
}