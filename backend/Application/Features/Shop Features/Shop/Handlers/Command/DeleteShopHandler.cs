using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Shop.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Handlers.Command;

public class DeleteShopHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<DeleteShopRequest, BaseResponse<ShopResponseDTO>>
{

    public async Task<BaseResponse<ShopResponseDTO>> Handle(DeleteShopRequest request, CancellationToken cancellationToken)
    {
        var shop = await unitOfWork.ShopRepository.GetById(request.Id);
        if (shop == null)
        {
            throw new NotFoundException("Shop not found");
        }

        await unitOfWork.ShopRepository.Delete(shop);

        return new BaseResponse<ShopResponseDTO>
        {
            Message = "Shop Deleted Successfully",
            Success = true
        };
    }
}