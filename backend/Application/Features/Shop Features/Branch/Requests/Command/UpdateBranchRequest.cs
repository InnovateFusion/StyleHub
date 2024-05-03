using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Requests.Command;

public class UpdateBranchRequest: IRequest<BaseResponse<BranchResponseDTO>>
{
    public required UpdateBranchDTO updateBranchDTO { get; set; }
}