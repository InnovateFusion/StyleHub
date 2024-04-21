using System.ComponentModel.DataAnnotations;
using backend.Domain.Common;

namespace backend.Domain.Entities.Common;

public class Chat: BaseEntity
{
    public required string Message { get; set; }
    public required string Type { get; set; }
    [Required]
    public virtual required User.User Sender { get; set; }
    [Required]
    public virtual required User.User Receiver { get; set; }
}