using backend.Application.DTO.Shop.BranchDTO.DTO;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Requests.Queries;

public class GetBranchRequest: IRequest<BranchResponseDTO>
{
    public required string Id { get; set; }
}