using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Shop;

public class BranchRepository(StyleHubDBContext context): GenericRepository<Branch>(context),
    IBranchRepository
{
  
    public async  Task<IReadOnlyList<Branch>> GetAll(string? shopId = null, string? search = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        var query = context.Branches.AsSplitQuery()
            .AsNoTracking();
        if (!string.IsNullOrEmpty(shopId))
        {
            query = query.Where(x => x.ShopId == shopId);
        }

        if (!string.IsNullOrEmpty(search))
        {
            query =  query.Where(p =>
                EF.Functions.Like(p.City, $"%{search}%")
                || EF.Functions.Like(p.Address, $"%{search}%")
            );
        }

        if (!string.IsNullOrEmpty(sortBy))
        {
            var entityType = typeof(Domain.Entities.Shop.Shop);
            var property = entityType.GetProperty(sortBy);
            if (property == null || (sortOrder != "asc" && sortOrder != "desc"))
            {
                throw new ArgumentException($"Property {sortBy} not found");
            }
            query = sortOrder switch
            {
                "asc" => query.OrderBy(p => EF.Property<object>(p, sortBy)),
                "desc" => query.OrderByDescending(p => EF.Property<object>(p, sortBy)),
                _ => query.OrderByDescending(p => p.CreatedAt)
            };
        }

        return await query.Skip(skip).Take(limit).ToListAsync();
    }

    public async Task<Branch> GetById(string id)
    {
        var result = await context.Branches.FirstOrDefaultAsync(x => x.Id == id);
        return result!;
    }
}