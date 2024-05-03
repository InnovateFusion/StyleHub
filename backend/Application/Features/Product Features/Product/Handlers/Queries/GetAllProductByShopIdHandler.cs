using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Product.ProductDTO.DTO;
using backend.Application.Features.Product_Features.Product.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Product_Features.Product.Handlers.Queries
{
    public class GetAllProductShopIdHandler(IUnitOfWork unitOfWork, IMapper mapper)
        : IRequestHandler<GetAllProductShopId, List<ProductResponseDTO>>
    {
        public async Task<List<ProductResponseDTO>> Handle(
            GetAllProductShopId request,
            CancellationToken cancellationToken
        )
        {
            var products = await unitOfWork.ProductRepository.GetByShopId(
                shopId: request.ShopId,
                skip: request.Skip,
                limit: request.Limit
            );
            var productResponse = mapper.Map<List<ProductResponseDTO>>(products);
            return productResponse;
        }
    }
}
