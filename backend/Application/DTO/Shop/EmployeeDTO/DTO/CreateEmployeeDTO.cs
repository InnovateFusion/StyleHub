namespace backend.Application.DTO.Shop.EmployeeDTO.DTO;

public class CreateEmployeeDTO
{
    public string ShopId { get; set; }
    public string UserId { get; set; }
    public bool CanManageProduct { get; set; }
    public bool CanManageShop { get; set; }
    public bool CanManageEmployee { get; set; }
}