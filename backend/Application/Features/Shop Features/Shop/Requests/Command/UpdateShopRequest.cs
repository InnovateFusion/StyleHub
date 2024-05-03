using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Requests.Command;

public class UpdateShopRequest: IRequest<BaseResponse<ShopResponseDTO>>
{
    public required UpdateShopDTO updateShopDto { get; set; }
}