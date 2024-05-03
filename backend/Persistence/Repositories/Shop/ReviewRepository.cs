using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Shop;

public class ReviewRepository(StyleHubDBContext context): GenericRepository<Review>(context),
    IReviewRepository
{

    public async Task<IReadOnlyList<Review>> GetAll(string? userId = null, string? shopId = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        throw new NotImplementedException();
    }

    public async Task<Review> GetById(string id)
    {
        var result = await context.Reviews.FirstOrDefaultAsync(x => x.Id == id);
        return result!;
    }
}