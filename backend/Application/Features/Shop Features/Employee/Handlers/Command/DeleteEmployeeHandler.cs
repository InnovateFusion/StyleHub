using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Employee.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Handlers.Command;

public class DeleteEmployeeHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<DeleteEmployeeRequest, BaseResponse<EmployeeResponseDTO>>
{
    public async Task<BaseResponse<EmployeeResponseDTO>> Handle(DeleteEmployeeRequest request, CancellationToken cancellationToken)
    {
        var employee = await unitOfWork.EmployeeRepository.GetById(request.Id);
        if (employee == null)
        {
            throw new NotFoundException("Employee not found");
        }
        await unitOfWork.EmployeeRepository.Delete(employee);
        return new BaseResponse<EmployeeResponseDTO>
        {
            Message = "Employee Deleted Successfully",
            Success = true
        };
    }
}
