using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Review: BaseEntity
{
    public required string Comment { get; set; }
    public required int Rating { get; set; }
    public virtual required Shop Shop { get; set; }
    public virtual required User.User User { get; set; }
}