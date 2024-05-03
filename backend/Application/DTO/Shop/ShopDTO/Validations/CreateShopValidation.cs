using backend.Application.DTO.Shop.ShopDTO.DTO;
using FluentValidation;

namespace backend.Application.DTO.Shop.ShopDTO.Validations;

public class CreateShopValidation: AbstractValidator<CreateShopDTO>
{
    public CreateShopValidation()
    {
        string[] services = { "men", "women"};
        RuleFor(x => x.Name)
            .NotNull()
            .WithMessage("Name is required")
            .NotEmpty()
            .WithMessage("Name cannot be empty")
            .MinimumLength(3)
            .WithMessage("Name must be at least 3 characters long")
            .MaximumLength(50)
            .WithMessage("Name must be at most 50 characters long");

        RuleFor(x => x.Description)
            .NotNull()
            .WithMessage("Description is required")
            .NotEmpty()
            .WithMessage("Description cannot be empty")
            .MinimumLength(3)
            .WithMessage("Description must be at least 3 characters long")
            .MaximumLength(255)
            .WithMessage("Description must be at most 255 characters long");

        RuleFor(x => x.Services)
            .NotNull()
            .WithMessage("Services are required")
            .Must(x => x.All(y => services.Contains(y)))
            .WithMessage("Service must from the list");

        RuleFor(x => x.City)
            .NotNull()
            .WithMessage("City is required")
            .NotEmpty()
            .WithMessage("City cannot be empty");

        RuleFor(x => x.Latitude)
            .NotNull()
            .WithMessage("Latitude is required")
            .GreaterThanOrEqualTo(-90)
            .WithMessage("Latitude must be greater than -90")
            .LessThanOrEqualTo(90)
            .WithMessage("Latitude must be less than 90");
        
        RuleFor(x => x.Longitude)
            .NotNull()
            .WithMessage("Longitude is required")
            .GreaterThanOrEqualTo(-180)
            .WithMessage("Longitude must be greater than -180")
            .LessThanOrEqualTo(180)
            .WithMessage("Longitude must be less than 180");

        RuleFor(x => x.PhoneNumber)
            .NotNull()
            .WithMessage("PhoneNumber is required")
            .NotEmpty()
            .WithMessage("PhoneNumber cannot be empty");
    }
}