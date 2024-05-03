using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Features.Shop_Features.Employee.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Handlers.Command;

public class CreateEmployeeHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<CreateEmployeeRequest, BaseResponse<EmployeeResponseDTO>>
{
    public async Task<BaseResponse<EmployeeResponseDTO>> Handle(CreateEmployeeRequest request, CancellationToken cancellationToken)
    {
        var employee = mapper.Map<Domain.Entities.Shop.Employee>(request.createEmployeeDTO);
        await unitOfWork.EmployeeRepository.Add(employee);
        return new BaseResponse<EmployeeResponseDTO>
        {
            Message = "Employee Created Successfully",
            Success = true,
            Data = mapper.Map<EmployeeResponseDTO>(employee)
        };
    }
}