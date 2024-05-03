using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Branch.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Handlers.Command;

public class DeleteBranchHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<DeleteBranchRequest, BaseResponse<BranchResponseDTO>>
{
    public async Task<BaseResponse<BranchResponseDTO>> Handle(DeleteBranchRequest request, CancellationToken cancellationToken)
    {
        var branch = await unitOfWork.BranchRepository.GetById(request.Id);
        if (branch == null)
        {
            throw new NotFoundException("No Branch Found");
        }
        await unitOfWork.BranchRepository.Delete(branch);
        return new BaseResponse<BranchResponseDTO>
        {
            Message = "Shop Created Successfully",
            Success = true,
            Data = mapper.Map<BranchResponseDTO>(branch)
        };
    }
}