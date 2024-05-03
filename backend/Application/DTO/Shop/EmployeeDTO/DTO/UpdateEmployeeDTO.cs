namespace backend.Application.DTO.Shop.EmployeeDTO.DTO;

public class UpdateEmployeeDTO
{
    public string Id { get; set; }
    public bool? CanManageProduct { get; set; }
    public bool? CanManageShop { get; set; }
    public bool? CanManageEmployee { get; set; }
    public string? ShopId { get; set; }
}