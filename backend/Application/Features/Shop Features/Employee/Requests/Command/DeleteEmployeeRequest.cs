using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Requests.Command;

public class DeleteEmployeeRequest : IRequest<BaseResponse<EmployeeResponseDTO>>
{ 
        public required string Id { get; set; }
}