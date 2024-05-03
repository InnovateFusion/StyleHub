using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Features.Shop_Features.Branch.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Handlers.Queries;

public class GetAllBranchHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<GetAllBranchRequest, List<BranchResponseDTO>>
{
    public async Task<List<BranchResponseDTO>> Handle(GetAllBranchRequest request, CancellationToken cancellationToken)
    {
        var branches = await unitOfWork.BranchRepository.GetAll(
            request.ShopId,
            request.Search,
            request.SortBy,
            request.SortOrder,
            request.Skip,
            request.Limit
        );
        var responseBranches = mapper.Map<List<BranchResponseDTO>>(branches);
        return responseBranches;
    }
}