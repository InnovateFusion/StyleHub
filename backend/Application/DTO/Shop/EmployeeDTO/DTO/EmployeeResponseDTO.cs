namespace backend.Application.DTO.Shop.EmployeeDTO.DTO;

public class EmployeeResponseDTO
{
    public string Id { get; set; }
    public bool IsOwner { get; set; }
    public bool CanManageProduct { get; set; }
    public bool CanManageShop { get; set; }
    public bool CanManageEmployee { get; set; }
}