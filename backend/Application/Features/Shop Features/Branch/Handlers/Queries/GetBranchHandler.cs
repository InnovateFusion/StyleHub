using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Branch.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Handlers.Queries;

public class GetBranchHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<GetBranchRequest, BranchResponseDTO>
{
    public async Task<BranchResponseDTO> Handle(GetBranchRequest request, CancellationToken cancellationToken)
    {
        var branch = await unitOfWork.BranchRepository.GetById(request.Id);
        if (branch == null)
        {
            throw new NotFoundException("No Branch Found");
        }
        var responseBranch = mapper.Map<BranchResponseDTO>(branch);
        return responseBranch;
    }
}
