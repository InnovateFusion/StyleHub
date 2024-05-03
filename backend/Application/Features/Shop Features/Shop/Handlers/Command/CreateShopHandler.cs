using System.Text.Json;
using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Features.Shop_Features.Shop.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Handlers.Command;

public class CreateShopHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<CreateShopRequest, BaseResponse<ShopResponseDTO>>
{
    public async Task<BaseResponse<ShopResponseDTO>> Handle(CreateShopRequest request, CancellationToken cancellationToken)
    {
        var shop = mapper.Map<Domain.Entities.Shop.Shop>(request.Shop!);
        shop.ServiceType = JsonSerializer.Serialize(request.Shop.Services);
        shop.SocialMedias = JsonSerializer.Serialize(request.Shop.SocialMedias);
     
        var responseShop = new ShopResponseDTO
        {   
            Id = shop.Id,
            Name = shop.Name,
            Description = shop.Description,
            City = shop.City,
            Latitude = shop.Latitude,
            Longitude = shop.Longitude,
            Services = JsonSerializer.Deserialize<List<string>>(shop.ServiceType) ?? [],
            SocialMedias = JsonSerializer.Deserialize<List<SocialMediaDTO>>(shop.SocialMedias) ?? [],
            PhoneNumber = shop.PhoneNumber,
            OnWork = shop.OnWork,
            IsVerified = shop.IsVerified,
            Email = shop.Email,
            Website = shop.Website,
            EstablishedAt = shop.EstablishedAt,
            ProfileImage = shop.ProfileImage,
            CoverImage = shop.CoverImage
        };
        
        var employee = new Domain.Entities.Shop.Employee
        {
            UserId = request.UserId,
            ShopId = shop.Id,
            IsOwner = true,
            CanManageEmployee = true,
            CanManageProduct = true,
            CanManageShop = true
        };
        
        await unitOfWork.EmployeeRepository.Add(employee);
        await unitOfWork.ShopRepository.Add(shop);
        
        return new BaseResponse<ShopResponseDTO>
        {
            Message = "Shop Created Successfully",
            Success = true,
            Data = responseShop
        };
    }
}