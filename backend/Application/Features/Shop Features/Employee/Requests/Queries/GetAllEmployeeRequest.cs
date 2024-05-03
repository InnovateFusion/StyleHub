using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Requests.Queries;

public class GetAllEmployeeRequest: IRequest<List<EmployeeResponseDTO>>
{
    public string? UserId { get; set; }
    public string? ShopId { get; set; }
    public string? SortBy { get; set; }
    public string? SortOrder { get; set; }
    public int Skip { get; set; }
    public int Limit { get; set; }
}