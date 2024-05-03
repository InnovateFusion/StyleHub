using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Employee.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Handlers.Queries;

public class GetEmployeeHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<GetEmployeeRequest, EmployeeResponseDTO>
{
    public async Task<EmployeeResponseDTO> Handle(GetEmployeeRequest request, CancellationToken cancellationToken)
    {
           var employee = await unitOfWork.EmployeeRepository.GetById(request.Id);
           if (employee == null)
           {
               throw new NotFoundException("Employee not found");
           }
           var employeeDTO = mapper.Map<EmployeeResponseDTO>(employee);
           return employeeDTO;
    }
}