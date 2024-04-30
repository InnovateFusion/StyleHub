using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;

namespace backend.Persistence.Repositories.Shop;

public class SubscriberRepository(StyleHubDBContext context) : GenericRepository<Subscriber>(context),
    ISubscriberRepository
{
    public Task<IReadOnlyList<Subscriber>> GetAll(string? userId = null, string? shopId = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        throw new NotImplementedException();
    }

    public Task<Subscriber> GetById(string id)
    {
        throw new NotImplementedException();
    }
}