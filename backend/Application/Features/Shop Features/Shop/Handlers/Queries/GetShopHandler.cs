using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Shop.Requests.Queries;
using MediatR;
using System.Text.Json;

namespace backend.Application.Features.Shop_Features.Shop.Handlers.Queries;

public class GetShopHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<GetShopRequest, ShopResponseDTO>
{
    public async Task<ShopResponseDTO> Handle(GetShopRequest request, CancellationToken cancellationToken)
    {
        var shop = await unitOfWork.ShopRepository.GetById(request.Id);
        if (shop == null)
        {
            throw new NotFoundException("Shop not found");
        }

        return new ShopResponseDTO
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
    }
}