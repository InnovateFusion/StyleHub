namespace backend.Application.DTO.Shop.ShopDTO.DTO;

public class ShopResponseCardDTO
{
    public required string Id { get; set; }
    public required string Name { get; set; }
    public required string City { get; set; }
    public string? ProfileImage { get; set; }
}