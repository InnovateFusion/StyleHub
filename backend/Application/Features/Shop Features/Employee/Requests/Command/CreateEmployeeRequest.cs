using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Requests.Command;

public class CreateEmployeeRequest: IRequest<BaseResponse<EmployeeResponseDTO>>
{
    public required CreateEmployeeDTO createEmployeeDTO { get; set; }
}