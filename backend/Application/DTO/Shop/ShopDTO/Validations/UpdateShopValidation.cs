using backend.Application.DTO.Shop.ShopDTO.DTO;
using FluentValidation;

namespace backend.Application.DTO.Shop.ShopDTO.Validations;

public class UpdateShopValidation: AbstractValidator<UpdateShopDTO>
{
    public UpdateShopValidation()
    {
        string[] services = { "men", "women" };
        
        RuleFor(x => x.Name)
            .Cascade(CascadeMode.Stop)
            .MinimumLength(3)
            .WithMessage("Name must be at least 3 characters long")
            .MaximumLength(50)
            .WithMessage("Name must be at most 50 characters long");
        
        RuleFor(x => x.Description)
            .Cascade(CascadeMode.Stop)
            .MinimumLength(3)
            .WithMessage("Description must be at least 3 characters long")
            .MaximumLength(255)
            .WithMessage("Description must be at most 255 characters long");
        
        RuleFor(x => x.Services)
            .Cascade(CascadeMode.Stop)
            .Must(x => x!.All(y => services.Contains(y)))
            .WithMessage("Service must from the list");
    }

}