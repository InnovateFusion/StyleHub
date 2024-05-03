using System.Security.Claims;
using backend.Application.DTO.Shop.EmployeeDTO.DTO;
using backend.Application.Features.Shop_Features.Employee.Requests.Command;
using backend.Application.Features.Shop_Features.Employee.Requests.Queries;
using backend.Application.Response;
using MediatR;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;

namespace backend.WebApi.Controllers.Shop;

[ApiController]
[Route("api/[controller]")]
public class EmployeeController(IMediator mediator) : ControllerBase
{
    [HttpPost]
    [Authorize]
    public async Task<ActionResult<BaseResponse<EmployeeResponseDTO>>> CreateEmployee(
        [FromBody] CreateEmployeeDTO employeeDto
    )
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        
        var result = await mediator.Send(
            new CreateEmployeeRequest
            {
                createEmployeeDTO = employeeDto,
            }
        );
        return Ok(result);
    }
    
    [HttpPut]
    [Authorize]
    public async Task<ActionResult<BaseResponse<EmployeeResponseDTO>>> UpdateEmployee(
        [FromBody] UpdateEmployeeDTO employeeDto
    )
    {
        var result = await mediator.Send(
            new UpdateEmployeeRequest
            {
                updateEmployeeDTO = employeeDto
            }
        );
        return Ok(result);
    }
    
    [HttpDelete ("{id}")]
    [Authorize]
    public async Task<ActionResult<BaseResponse<EmployeeResponseDTO>>> DeleteEmployee(
        string id
    )
    {
        var result = await mediator.Send(
            new DeleteEmployeeRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
    
    [HttpGet]
    public async Task<ActionResult<List<EmployeeResponseDTO>>> GetAllEmployees(
        [FromQuery] string? userId,
        [FromQuery] string? shopId,
        [FromQuery] string? sortBy,
        [FromQuery] string? sortOrder,
        [FromQuery] int skip = 0,
        [FromQuery] int limit = 15
    )
    {
        var result = await mediator.Send(
            new GetAllEmployeeRequest
            {
                UserId = userId ?? null,
                ShopId = shopId,
                SortBy = sortBy,
                SortOrder = sortOrder,
                Skip = skip,
                Limit = limit
            }
        );
        return Ok(result);
    }
    
    [HttpGet("{id}")]
    public async Task<ActionResult<EmployeeResponseDTO>> GetEmployee(string id)
    {
        var result = await mediator.Send(
            new GetEmployeeRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
    
    [HttpGet("shop/{shopId}")]
    [Authorize]
    public async Task<ActionResult<List<EmployeeResponseDTO>>> GetShopEmployees(string shopId)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        
        var result = await mediator.Send(
            new GetAllEmployeeRequest
            {
                UserId = userId,
                ShopId = shopId
            }
        );
        return Ok(result);
    }
}