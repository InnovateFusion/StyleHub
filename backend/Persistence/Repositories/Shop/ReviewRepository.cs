using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;

namespace backend.Persistence.Repositories.Shop;

public class ReviewRepository(StyleHubDBContext context): GenericRepository<Review>(context),
    IReviewRepository
{

    public Task<IReadOnlyList<Review>> GetAll(string? userId = null, string? shopId = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        throw new NotImplementedException();
    }

    public Task<Review> GetById(string id)
    {
        throw new NotImplementedException();
    }
}