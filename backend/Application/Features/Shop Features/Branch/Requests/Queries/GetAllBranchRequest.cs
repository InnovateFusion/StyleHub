using backend.Application.DTO.Shop.BranchDTO.DTO;
using MediatR;

namespace backend.Application.Features.Shop_Features.Branch.Requests.Queries;

public class GetAllBranchRequest: IRequest<List<BranchResponseDTO>>
{
    public string? Search { get; set; }
    public string? ShopId { get; set; }
    public string? SortBy { get; set; }
    public string? SortOrder { get; set; }
    public int Skip { get; set; }
    public int Limit { get; set; }
}