using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Features.Shop_Features.Employee.Requests.Queries;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Handlers.Queries;

public class GetAllEmployeeHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<GetAllEmployeeRequest, List<EmployeeResponseDTO>>
{

    public async Task<List<EmployeeResponseDTO>> Handle(GetAllEmployeeRequest request, CancellationToken cancellationToken)
    {
        var employee = await unitOfWork.EmployeeRepository.GetAll(
            request.UserId,
            request.ShopId,
            request.SortBy,
            request.SortOrder,
            request.Skip,
            request.Limit
        );
        var employeeDTO = mapper.Map<List<EmployeeResponseDTO>>(employee);
        return employeeDTO;
    }
}
