using System.ComponentModel.DataAnnotations.Schema;
using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Branch: BaseEntity
{
    public required string City { get; set; }
    public required double Latitude { get; set; }
    public required double Longitude { get; set; }
    public string Address { get; set; }
    [ForeignKey("Shop")]
    public required string ShopId { get; set; }
}