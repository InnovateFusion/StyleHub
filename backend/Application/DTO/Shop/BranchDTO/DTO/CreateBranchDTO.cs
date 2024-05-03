namespace backend.Application.DTO.Shop.BranchDTO.DTO;

public class CreateBranchDTO
{
    public required string City { get; set; }
    public required double Latitude { get; set; }
    public required double Longitude { get; set; }
    public required string Address { get; set; }
    public required string  ShopId { get; set; }
}