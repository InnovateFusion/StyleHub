namespace backend.Application.DTO.Shop.BranchDTO.DTO;

public class UpdateBranchDTO
{
    public required string Id { get; set; }
    public string? City { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
    public string? Address { get; set; }
    public string? ShopId { get; set; }
}