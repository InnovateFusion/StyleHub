using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using backend.Domain.Common;

namespace backend.Domain.Entities.Shop;

public class Shop: BaseEntity
{
    [Required]
    public required string Name { get; set; }
    public required string Description { get; set; }
    public required string ProfileImage { get; set; }
    public required string CoverImage { get; set; }
    [Required]
    public required string ServiceType { get; set; }
    public required string PhoneNumber { get; set; }
    public required string SocialMedias { get; set; }
    public required string Email { get; set; }
    public required string Website { get; set; }
    public required string City { get; set; }
    public required double Latitude { get; set; }
    public required double Longitude { get; set; }
    public required bool OnWork { get; set; } = false;
    public required bool IsVerified { get; set; } = false;
    public virtual required User.User CreatedBy { get; set; }
    public required DateTime EstablishedAt { get; set; }
    public required string LicenseNumber { get; set; }
    public required string LicenseImage { get; set; }
    public virtual HashSet<Branch> Branches { get; set; } = new HashSet<Branch>();
    public virtual HashSet<Review> Reviews { get; set; } = new HashSet<Review>();
    public virtual HashSet<Employee> Employees { get; set; } = new HashSet<Employee>();
}