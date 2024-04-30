using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Domain.Entities.Shop;

namespace backend.Application.Contracts.Persistence.Repositories.Shop;

public interface ISubscriberRepository: IGenericRepository<Subscriber>
{
    Task<IReadOnlyList<Subscriber>> GetAll(
        string? userId = null,
        string? shopId = null,
        string? sortBy = null,
        string? sortOrder = null,
        int skip = 0,
        int limit = 15
    );
    
    Task<Subscriber> GetById(string id);
}