using backend.Application.Contracts.Persistence.Repositories.Common;

namespace backend.Application.Contracts.Persistence.Repositories.Shop;

public interface IShopRepository : IGenericRepository<Domain.Entities.Shop.Shop>
{
    Task<IReadOnlyList<Domain.Entities.Shop.Shop>> GetAll(
        string? search = null,
        double? latitude = null,
        double? longitude = null,
        double? radius = null,
        string? sortBy = null,
        string? sortOrder = null,
        int skip = 0,
        int limit = 15
    );

    Task<Domain.Entities.Shop.Shop> GetById(string id);
    
    Task<List<Domain .Entities.Common.Image>> GetShopImage(string shopId);
}