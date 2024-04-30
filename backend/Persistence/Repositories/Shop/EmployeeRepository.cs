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
        var query = context.Employees.AsQueryable();

        if (!string.IsNullOrEmpty(userId))
        {
            query = query.Where(x => x.User.Id == userId);
        }

        if (!string.IsNullOrEmpty(shopId))
        {
            query = query.Where(x => x.Shop.Id == shopId);
        }

        return await query.Skip(skip).Take(limit).ToListAsync();
    }

    public async Task<Employee> GetById(string id)
    {
        var result = await context.Employees.FirstOrDefaultAsync(x => x.Id == id);
        return result!;
    }
}