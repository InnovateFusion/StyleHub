namespace backend.Application.DTO.Common.Chat.DTO;

public class RealTimeChatDTO
{
    public required string Id { get; set; }
    public required string Message { get; set; }
    public required string Type { get; set; }
    public required RealTimeChatUserDataDTO Sender { get; set; }
    public required RealTimeChatUserDataDTO Receiver { get; set; }
    public required bool IsRead { get; set; }
    public required DateTime CreatedAt { get; set; }
}