using System.ComponentModel.DataAnnotations.Schema;
using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Employee: BaseEntity
{
    public bool IsOwner { get; set; } = false;
    public bool CanManageProduct { get; set; } = false;
    public bool CanManageShop { get; set; } = false;
    public bool CanManageEmployee { get; set; } = false;
    [ForeignKey("User")]
    public required string UserId { get; set; }
    [ForeignKey("Shop")]
    public required string ShopId { get; set; }
}