using Application.DTO.ProductDTO.DTO;
using Application.Features.Product.Requests.Queries;
using MediatR;
using AutoMapper;
using Application.Contracts;
using Application.Exceptions;

namespace Application.Features.Product.Handlers.Queries
{
    public class GetProductByIdHandler : IRequestHandler<GetProductById, ProductResponseDTO>
    {

        private readonly IMapper _mapper;


        private readonly IUnitOfWork _unitOfWork;

        public GetProductByIdHandler(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<ProductResponseDTO> Handle(GetProductById request, CancellationToken cancellationToken)
        {
            if (request.Id == null || request.Id.Length == 0)
            {
                throw new BadRequestException("Id is required");
            }

            var product = await _unitOfWork.ProductRepository.GetById(request.Id);
            var productResponse = _mapper.Map<ProductResponseDTO>(product);
            return productResponse;
        }

    }
}