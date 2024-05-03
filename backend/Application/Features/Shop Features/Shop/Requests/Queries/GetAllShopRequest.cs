using backend.Application.DTO.Shop.ShopDTO.DTO;
using MediatR;

namespace backend.Application.Features.Shop_Features.Shop.Requests.Queries;

public class GetAllShopRequest : IRequest<List<ShopResponseCardDTO>>
{
    public string? Search { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
    public double? RadiusInKilometers { get; set; }
    public string? SortBy { get; set; }
    public string? SortOrder { get; set; }
    public required int Skip { get; set; }
    public required int Limit { get; set; } 
}