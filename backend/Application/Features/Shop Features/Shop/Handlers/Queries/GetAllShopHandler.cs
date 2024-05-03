using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Features.Shop_Features.Shop.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Handlers.Queries;

public class GetAllShopHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<GetAllShopRequest, List<ShopResponseCardDTO>>
{
    public async Task<List<ShopResponseCardDTO>> Handle(GetAllShopRequest request, CancellationToken cancellationToken)
    {
        var shops = await unitOfWork.ShopRepository.GetAll(
            request.Search,
            request.Latitude,
            request.Longitude,
            request.RadiusInKilometers,
            request.SortBy,
            request.SortOrder,
            request.Skip,
            request.Limit
        );

        return mapper.Map<List<ShopResponseCardDTO>>(shops);
    }
}

