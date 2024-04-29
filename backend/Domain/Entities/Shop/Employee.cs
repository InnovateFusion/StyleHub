using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Employee: BaseEntity
{
    public bool CanAddProduct { get; set; } = false;
    public bool CanRemoveProduct { get; set; } = false;
    public bool CanUpdateProduct { get; set; } = false;
    public bool CanAddEmployee { get; set; } = false;
    public bool CanRemoveEmployee { get; set; } = false;
    public bool CanUpdateEmployee { get; set; } = false;
    public virtual required Shop Shop { get; set; }
    public virtual required User.User User { get; set; }
}