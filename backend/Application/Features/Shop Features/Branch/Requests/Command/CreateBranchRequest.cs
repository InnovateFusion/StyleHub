using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Requests.Command;

public class CreateBranchRequest: IRequest<BaseResponse<BranchResponseDTO>>
{
   public required CreateBranchDTO createBranchDTO { get; set; }
}