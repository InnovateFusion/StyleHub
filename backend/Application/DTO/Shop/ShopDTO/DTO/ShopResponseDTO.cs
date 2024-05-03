namespace backend.Application.DTO.Shop.ShopDTO.DTO;

public class ShopResponseDTO
{
    public required string Id { get; set; }
    public required string Name { get; set; }
    public required string Description { get; set; } 
    public required List<string> Services { get; set; }
    public required string City { get; set; }
    public required double Latitude { get; set; }
    public required double Longitude { get; set; }
    public required string PhoneNumber { get; set; }
    public required List<SocialMediaDTO> SocialMedias { get; set; }
    public bool OnWork { get; set; }
    public bool IsVerified { get; set; }
    public string? Email { get; set; }
    public string? Website { get; set; }
    public DateTime? EstablishedAt { get; set; }
    public string? ProfileImage { get; set; }
    public string? CoverImage { get; set; }
}