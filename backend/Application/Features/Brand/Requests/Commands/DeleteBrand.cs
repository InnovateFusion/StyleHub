using Application.DTO.BrandDTO.DTO;
using Application.Response;
using MediatR;

namespace Application.Features.Brand.Requests.Commands
{
    public class DeleteBrandRequest : IRequest<BaseResponse<BrandResponseDTO>>
    {
        public string Id { get; set; } = string.Empty;
    }
}