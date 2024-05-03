using AutoMapper;
using System.Text.Json;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Shop.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Handlers.Command;

public class UpdateShopHandler (IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<UpdateShopRequest, BaseResponse<ShopResponseDTO>>
{
   public async Task<BaseResponse<ShopResponseDTO>> Handle(UpdateShopRequest request, CancellationToken cancellationToken)
    {
        var shop = await unitOfWork.ShopRepository.GetById(request.updateShopDto.Id);
        if (shop == null)
        {
            throw new NotFoundException("Shop not found");
        }

        shop.Name = request.updateShopDto.Name ?? shop.Name;
        shop.Description = request.updateShopDto.Description ?? shop.Description;
        shop.City = request.updateShopDto.City ?? shop.City;
        shop.Latitude = request.updateShopDto.Latitude ?? shop.Latitude;
        shop.Longitude = request.updateShopDto.Longitude ?? shop.Longitude;
        shop.ServiceType = JsonSerializer.Serialize(request.updateShopDto.Services) ?? shop.ServiceType;
        shop.SocialMedias = JsonSerializer.Serialize(request.updateShopDto.SocialMedias) ?? shop.SocialMedias;
        shop.PhoneNumber = request.updateShopDto.PhoneNumber ?? shop.PhoneNumber;
        shop.OnWork = request.updateShopDto.OnWork ?? shop.OnWork;
        shop.IsVerified = request.updateShopDto.IsVerified ?? shop.IsVerified;
        shop.Email = request.updateShopDto.Email ?? shop.Email;
        shop.Website = request.updateShopDto.Website ?? shop.Website;
        shop.EstablishedAt = request.updateShopDto.EstablishedAt ?? shop.EstablishedAt;
        shop.ProfileImage = request.updateShopDto.ProfileImage ?? shop.ProfileImage;
        shop.CoverImage = request.updateShopDto.CoverImage ?? shop.CoverImage;
        shop.UpdatedAt = DateTime.Now;

        await unitOfWork.ShopRepository.Update(shop);

        return new BaseResponse<ShopResponseDTO>
        {
            Message = "Shop Updated Successfully",
            Success = true,
            Data = new ShopResponseDTO
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
            }
        };
    }
}