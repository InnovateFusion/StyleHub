using backend.Application.DTO.Shop.BranchDTO.DTO;
using backend.Application.Features.Shop_Features.Branch.Requests.Command;
using backend.Application.Features.Shop_Features.Branch.Requests.Queries;
using backend.Application.Response;
using MediatR;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;

namespace backend.WebApi.Controllers.Shop;

[ApiController]
[Route("api/[controller]")]
public class BranchController(IMediator mediator) : ControllerBase
{
    [HttpPost]
    [Authorize]
    public async Task<ActionResult<BaseResponse<BranchResponseDTO>>> CreateBranch(
        [FromBody] CreateBranchDTO branchDto
    )
    {
        var result = await mediator.Send(
            new CreateBranchRequest
            {
                createBranchDTO = branchDto
            }
        );
        return Ok(result);
    }
    
    [HttpPut]
    [Authorize]
    public async Task<ActionResult<BaseResponse<BranchResponseDTO>>> UpdateBranch(
        [FromBody] UpdateBranchDTO branchDto
    )
    {
        var result = await mediator.Send(
            new UpdateBranchRequest
            {
                updateBranchDTO = branchDto
            }
        );
        return Ok(result);
    }
    
    [HttpGet]
    public async Task<ActionResult<List<BranchResponseDTO>>> GetAllBranches(
        [FromQuery] string? search,
        [FromQuery] string? shopId,
        [FromQuery] string? sortBy,
        [FromQuery] string? sortOrder,
        [FromQuery] int skip = 0,
        [FromQuery] int limit = 15
    )
    {
        var result = await mediator.Send(
            new GetAllBranchRequest
            {
                Search = search,
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
    public async Task<ActionResult<BranchResponseDTO>> GetBranch(string id)
    {
        var result = await mediator.Send(
            new GetBranchRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
    
    [HttpDelete("{id}")]
    [Authorize]
    public async Task<ActionResult<BaseResponse<BranchResponseDTO>>> DeleteBranch(string id)
    {
        var result = await mediator.Send(
            new DeleteBranchRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
}