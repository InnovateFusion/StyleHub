using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Branch.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Handlers.Command;

public class CreateBranchHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<CreateBranchRequest, BaseResponse<BranchResponseDTO>>
{
    public async Task<BaseResponse<BranchResponseDTO>> Handle(CreateBranchRequest request, CancellationToken cancellationToken)
    {
        var branch = mapper.Map<Domain.Entities.Shop.Branch>(request.createBranchDTO);
        var shop = await unitOfWork.ShopRepository.GetById(request.createBranchDTO.ShopId);
        if (shop == null)
        {
            throw new NotFoundException("Shop Not Found");
        }
        var responseBranch = mapper.Map<BranchResponseDTO>(branch);
        await unitOfWork.BranchRepository.Add(branch);
        return new BaseResponse<BranchResponseDTO>
        {
            Message = "Branch Created Successfully",
            Success = true,
            Data = responseBranch
        };
    }
}
