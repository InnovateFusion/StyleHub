using System.ComponentModel.DataAnnotations;
using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Shop: BaseEntity
{
    [Required]
    public required string Name { get; set; }
    [Required]
    public required string Description { get; set; }
    [Required]
    public required string  ServiceType { get; set; }
    [Required]
    public required string City { get; set; }
    [Required]
    public required double Latitude { get; set; }
    [Required]
    public required double Longitude { get; set; }
    [Required]
    public required string PhoneNumber { get; set; }
    [Required]
    public required string SocialMedias { get; set; }
    public required bool OnWork { get; set; } = false;
    public required bool IsVerified { get; set; } = false;
    public string? Email { get; set; }
    public string? Website { get; set; }
    public DateTime EstablishedAt { get; set; }
    public string? ProfileImage { get; set; }
    public string? CoverImage { get; set; }
    public string? LicenseNumber { get; set; }
    public string? LicenseImage { get; set; }
    public List<Employee> Employees { get; set; } = new List<Employee>();
}