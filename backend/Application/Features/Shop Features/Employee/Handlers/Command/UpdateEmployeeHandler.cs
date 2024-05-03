using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Shop_Features.Employee.Requests.Command;
using backend.Application.Response;
using MediatR;

namespace backend.Application.Features.Shop_Features.Employee.Handlers.Command;

public class UpdateEmployeeHandler(IUnitOfWork unitOfWork, IMapper mapper): IRequestHandler<UpdateEmployeeRequest, BaseResponse<EmployeeResponseDTO>>
{
    public async Task<BaseResponse<EmployeeResponseDTO>> Handle(UpdateEmployeeRequest request, CancellationToken cancellationToken)
    {
        var employee = await unitOfWork.EmployeeRepository.GetById(request.updateEmployeeDTO.Id);
        if (employee == null)
        {
            throw new NotFoundException("Employee not found");
        }
        employee.CanManageEmployee = request.updateEmployeeDTO.CanManageEmployee ?? employee.CanManageEmployee;
        employee.CanManageShop = request.updateEmployeeDTO.CanManageShop ?? employee.CanManageShop;
        employee.CanManageProduct = request.updateEmployeeDTO.CanManageProduct ?? employee.CanManageProduct;
        employee.ShopId = request.updateEmployeeDTO.ShopId ?? employee.ShopId;
        employee.UpdatedAt = DateTime.Now;
        
        await unitOfWork.EmployeeRepository.Update(employee);
        return new BaseResponse<EmployeeResponseDTO>
        {
            Message = "Employee Updated Successfully",
            Success = true,
            Data = mapper.Map<EmployeeResponseDTO>(employee)
        };
    }
}