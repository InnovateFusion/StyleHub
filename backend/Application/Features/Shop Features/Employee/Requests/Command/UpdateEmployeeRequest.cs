using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Requests.Command;

public class UpdateEmployeeRequest: IRequest<BaseResponse<EmployeeResponseDTO>>
{
    public required UpdateEmployeeDTO updateEmployeeDTO { get; set; }
}