using backend.Application.Contracts.Persistence;
using FluentValidation;

namespace backend.Application.DTO.Shop.EmployeeDTO.Validations;

public class UpdateEmployeeDTO: AbstractValidator<DTO.UpdateEmployeeDTO>
{
    public UpdateEmployeeDTO(IUnitOfWork unitOfWork)
    {
        RuleFor(x => x.Id).NotEmpty().WithMessage("Id is required");
        RuleFor(x => x.CanManageProduct)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .WithMessage("CanManageProduct is required");
        RuleFor(x => x.CanManageShop)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .WithMessage("CanManageShop is required");
        RuleFor(x => x.CanManageEmployee)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .WithMessage("CanManageEmployee is required");
        
        RuleFor(x => x.ShopId).MustAsync(async (shopId, cancellation) =>
        {
            if (string.IsNullOrEmpty(shopId)) return false;
            var result = await unitOfWork.ShopRepository.GetById(shopId);
            return result != null;
        }).WithMessage("Shop does not exist");
    }
}