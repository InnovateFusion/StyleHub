using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Domain.Entities.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Shop;

public class EmployeeRepository(StyleHubDBContext context): GenericRepository<Employee>(context),
    IEmployeeRepository
{
    public async Task<IReadOnlyList<Employee>> GetAll(string? userId = null, string? shopId = null, string? sortBy = null, string? sortOrder = null, int skip = 0,
        int limit = 15)
    {
        var query =  context.Employees.AsSplitQuery()
            .AsNoTracking();

        if (!string.IsNullOrEmpty(shopId))
        {
            query = query.Where(x => x.ShopId == shopId);
        }
        
        if (!string.IsNullOrEmpty(userId))
        {
            query = query.Where(x => x.UserId == userId);
        }
        
        if (!string.IsNullOrEmpty(sortBy))
        {
            var entityType = typeof(Employee);
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

    public async Task<Employee> GetById(string id)
    {
        var result = await context.Employees.FirstOrDefaultAsync(x => x.Id == id);
        return result!;
    }

    public async Task<Employee> GetByUserIdAndShopId(string userId, string shopId)
    {
        var result = await context.Employees.FirstOrDefaultAsync(x => x.UserId == userId && x.ShopId == shopId);
        return result!;
    }
}