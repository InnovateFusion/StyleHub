using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Domain.Entities.Shop;

namespace backend.Application.Contracts.Persistence.Repositories.Shop;

public interface IReviewRepository: IGenericRepository<Review>
{
    Task<IReadOnlyList<Review>> GetAll(
        string? userId = null,
        string? shopId = null,
        string? sortBy = null,
        string? sortOrder = null,
        int skip = 0,
        int limit = 15
    );
    
    Task<Review> GetById(string id);
}