namespace backend.Application.DTO.Shop.ShopDTO.DTO;

public class UpdateShopDTO
{ 
    public required string Id { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public List<string>? Services { get; set; }
    public string? City { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
    public string? PhoneNumber { get; set; }
    public bool? OnWork { get; set; }
    public bool? IsVerified { get; set; } 
    public string? Email { get; set; }
    public List<SocialMediaDTO>? SocialMedias { get; set; }
    public string? Website { get; set; }
    public DateTime? EstablishedAt { get; set; }
    public string? ProfileImage { get; set; }
    public string? CoverImage { get; set; }
}