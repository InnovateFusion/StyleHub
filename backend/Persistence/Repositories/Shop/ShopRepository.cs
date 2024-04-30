using backend.Application.Contracts.Persistence.Repositories.Product;
using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;

namespace backend.Persistence.Repositories.Shop;

public class ShopRepository(StyleHubDBContext context)  : GenericRepository<Domain.Entities.Shop.Shop>(context),
    IShopRepository
{
    public async Task<IReadOnlyList<Domain.Entities.Shop.Shop>> GetAll(string? userId = null, string? sortBy = null, string? sortOrder = null, int skip = 0, int limit = 15)
    {
        throw new NotImplementedException();
    }

    public Task<Domain.Entities.Shop.Shop> GetById(string id)
    {
        throw new NotImplementedException();
    }
}


