using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.DTO.BrandDTO.DTO;
using Application.Features.Brand.Requests.Commands;
using Application.Features.Brand.Requests.Queries;

namespace WebApi.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class BrandController : ControllerBase
    {
        private readonly IMediator _mediator;

        public BrandController(IMediator mediator)
        {
            _mediator = mediator;
        }


        [HttpGet]
        public async Task<ActionResult<List<BrandResponseDTO>>> fetchAllBrands()
        {
            var result = await _mediator.Send(new GetAllBrand());
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BrandResponseDTO>> fetchBrandById(string id)
        {
            var result = await _mediator.Send(new GetBrandById { Id = id });
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult<BrandResponseDTO>> CreateBrand([FromBody] CreateBrandRequest command)
        {
            var result = await _mediator.Send(command);

            return Ok(result);
        }

        [HttpPut]
        public async Task<ActionResult<BrandResponseDTO>> UpdateBrandRequest([FromBody] UpdateBrandRequest command)
        {
            var result = await _mediator.Send(command);
            return Ok(result);
        }


        [HttpDelete("{id}")]
        public async Task<ActionResult<BrandResponseDTO>> DeleteBrandRequest(string id)
        {
            var result = await _mediator.Send(new DeleteBrandRequest { Id = id });
            return Ok(result);
        }
    }
}