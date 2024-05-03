using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Branch.Requests.Command;
using backend.Application.Response;
using MediatR;
using Microsoft.IdentityModel.Tokens;

namespace backend.Application.Features.Shop_Features.Branch.Handlers.Command;

public class UpdateBranchHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<UpdateBranchRequest, BaseResponse<BranchResponseDTO>>
{
    public async Task<BaseResponse<BranchResponseDTO>> Handle(UpdateBranchRequest request, CancellationToken cancellationToken)
    {
        var branch = await unitOfWork.BranchRepository.GetById(request.updateBranchDTO.Id);
        if (branch == null)
        {
            throw new NotFoundException("No Branch Found");
        }

        if (request.updateBranchDTO.ShopId != null)
        {
            var shop = await unitOfWork.ShopRepository.GetById(request.updateBranchDTO.ShopId);
            if (shop == null)
            {
                throw new NotFoundException("Shop Not Found-1");
            }
            branch.ShopId = shop.Id;
        }

        branch.City = request.updateBranchDTO.City ?? branch.City;
        branch.Latitude = request.updateBranchDTO.Latitude ?? branch.Latitude;
        branch.Longitude = request.updateBranchDTO.Longitude ?? branch.Longitude;
        branch.Address = request.updateBranchDTO.Address ?? branch.Address;
        branch.UpdatedAt = DateTime.Now;
        await unitOfWork.BranchRepository.Update(branch);
        return new BaseResponse<BranchResponseDTO>
        {
            Message = "Branch Updated Successfully",
            Success = true,
            Data = mapper.Map<BranchResponseDTO>(branch)
        };
    }
}