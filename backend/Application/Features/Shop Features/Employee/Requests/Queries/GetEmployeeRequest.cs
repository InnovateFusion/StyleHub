using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Requests.Queries;

public class GetEmployeeRequest: IRequest<EmployeeResponseDTO>
{
    public required string Id { get; set; }
}