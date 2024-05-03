using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using FluentValidation;

namespace backend.Application.DTO.Shop.EmployeeDTO.Validations;

public class CreateEmployeeDTO: AbstractValidator<DTO.CreateEmployeeDTO>
{
    public CreateEmployeeDTO(IUnitOfWork unitOfWork)
    {
        RuleFor(x => x.ShopId).NotEmpty().NotNull();
        RuleFor(x => x.UserId).NotEmpty().NotNull();
        RuleFor(x => x.CanManageProduct).NotNull();
        RuleFor(x => x.CanManageShop).NotNull();
        RuleFor(x => x.CanManageEmployee).NotNull();
        
        RuleFor(x => x.ShopId).MustAsync(async (shopId, cancellation) =>
        {
            if (string.IsNullOrEmpty(shopId)) return false;
            var result = await unitOfWork.ShopRepository.GetById(shopId);
            return result != null;
        }).WithMessage("Shop does not exist");
        
        RuleFor(x => x.UserId).MustAsync(async (userId, cancellation) =>
        {
            if (string.IsNullOrEmpty(userId)) return false;
            var result = await unitOfWork.UserRepository.GetById(userId);
            return result != null;
        }).WithMessage("User does not exist");
    }
}