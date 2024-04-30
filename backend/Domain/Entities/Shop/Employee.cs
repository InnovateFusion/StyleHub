using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Employee: BaseEntity
{
    public bool IsOwner { get; set; } = false;
    public bool CanManageProduct { get; set; } = false;
    public bool CanManageShop { get; set; } = false;
    public bool CanManageEmployee { get; set; } = false;
    public virtual required Shop Shop { get; set; }
    public virtual required User.User User { get; set; }
}