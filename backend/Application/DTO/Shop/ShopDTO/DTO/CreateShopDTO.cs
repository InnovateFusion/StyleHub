using System.ComponentModel.DataAnnotations;

namespace backend.Application.DTO.Shop.ShopDTO.DTO;

public class CreateShopDTO
{
    [Required(ErrorMessage = "Name is required")]
    public string Name { get; set; }

    [Required(ErrorMessage = "Description is required")]
    public string Description { get; set; }

    [Required(ErrorMessage = "Services are required")]
    public List<string> Services { get; set; }

    [Required(ErrorMessage = "City is required")]
    public string City { get; set; }

    [Required(ErrorMessage = "Latitude is required")]
    public double Latitude { get; set; }

    [Required(ErrorMessage = "Longitude is required")]
    public double Longitude { get; set; }

    [Required(ErrorMessage = "PhoneNumber is required")]
    public string PhoneNumber { get; set; }

    public bool OnWork { get; set; } = false;
    public bool IsVerified { get; set; } = false;

    public string? Email { get; set; }
    public List<SocialMediaDTO> SocialMedias { get; set; }
    public string? Website { get; set; }
    public DateTime? EstablishedAt { get; set; }
    public string? ProfileImage { get; set; }
    public string? CoverImage { get; set; }
}