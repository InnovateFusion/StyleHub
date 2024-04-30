using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Shop;

public class BranchRepository(StyleHubDBContext context): GenericRepository<Branch>(context),
    IBranchRepository
{
    public async Task<IReadOnlyList<Branch>> GetAll(string? shopId = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        var query = context.Branches.AsQueryable();

        if (!string.IsNullOrEmpty(shopId))
        {
            query = query.Where(x => x.Shop.Id == shopId);
        }

        if (!string.IsNullOrEmpty(sortBy))
        {
            switch (sortBy.ToLower())
            {
                case "city":
                    query = sortOrder?.ToLower() == "desc" ? query.OrderByDescending(x => x.City) : query.OrderBy(x => x.City);
                    break;
                case "address":
                    query = sortOrder?.ToLower() == "desc" ? query.OrderByDescending(x => x.Address) : query.OrderBy(x => x.Address);
                    break;
            }
        }

        return await query.Skip(skip).Take(limit).ToListAsync();
    }

    public async Task<Branch> GetById(string id)
    {
        var result = await context.Branches.FirstOrDefaultAsync(x => x.Id == id);
        return result!;
    }
}