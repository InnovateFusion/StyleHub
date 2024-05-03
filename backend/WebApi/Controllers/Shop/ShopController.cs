using System.Security.Claims;
using backend.Application.DTO.Shop.ShopDTO.DTO;
using backend.Application.Features.Shop_Features.Shop.Requests.Command;
using backend.Application.Features.Shop_Features.Shop.Requests.Queries;
using MediatR;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.Mvc;

namespace backend.WebApi.Controllers.Shop;

[ApiController]
[Route("api/[controller]")]
public class ShopController(IMediator mediator) : ControllerBase
{
    [HttpPost]
    [Authorize]
    public async Task<ActionResult<ShopResponseDTO>> CreateShop(
        [FromBody] CreateShopDTO shopDto
    )
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        var result = await mediator.Send(
            new  CreateShopRequest
            {
                Shop = shopDto,
                UserId = userId
            }
        );
        return Ok(result);
    }
    
    [HttpGet]
    public async Task<ActionResult<List<ShopResponseCardDTO>>> GetAllShops(
        [FromQuery] string? search,
        [FromQuery] double? latitude,
        [FromQuery] double? longitude,
        [FromQuery] double? radiusInKilometers,
        [FromQuery] string? sortBy,
        [FromQuery] string? sortOrder,
        [FromQuery] int skip = 0,
        [FromQuery] int limit = 15
    )
    {
        var result = await mediator.Send(
            new GetAllShopRequest
            {
                Search = search,
                Latitude = latitude,
                Longitude = longitude,
                RadiusInKilometers = radiusInKilometers,
                SortBy = sortBy,
                SortOrder = sortOrder,
                Skip = skip,
                Limit = limit
            }
            );
        return Ok(result);
    }
    
    [HttpGet("{id}")]
    public async Task<ActionResult<ShopResponseDTO>> GetShop(string id)
    {
        var result = await mediator.Send(
            new GetShopRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
    
    [HttpPut]
    [Authorize]
    public async Task<ActionResult<ShopResponseDTO>> UpdateShop(
        [FromBody] UpdateShopDTO shopDto
    )
    {
        var result = await mediator.Send(
            new UpdateShopRequest
            {
                updateShopDto = shopDto
            }
        );
        return Ok(result);
    }
    
    [HttpDelete("{id}")]
    [Authorize]
    public async Task<ActionResult> DeleteShop(string id)
    {
      var result = await mediator.Send(
            new DeleteShopRequest
            {
                Id = id
            }
        );
        return Ok(result);
    }
}