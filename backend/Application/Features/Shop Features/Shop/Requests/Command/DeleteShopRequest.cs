using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Requests.Command;

public class DeleteShopRequest: IRequest<BaseResponse<ShopResponseDTO>>
{
    public string Id { get; set; }
}