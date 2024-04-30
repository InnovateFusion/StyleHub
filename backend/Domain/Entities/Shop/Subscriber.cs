using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Domain.Entities.Shop;

public class Subscriber
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public virtual required Shop Shop { get; set; }
    [ForeignKey("User")]
    public required string UserId { get; set; }
}