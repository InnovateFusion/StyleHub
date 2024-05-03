using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Domain.Entities.Shop;

namespace backend.Application.Contracts.Persistence.Repositories.Shop;

public interface IEmployeeRepository : IGenericRepository<Employee>
{
    Task<IReadOnlyList<Employee>> GetAll(
        string? userId = null,
        string? shopId = null,
        string? sortBy = null,
        string? sortOrder = null,
        int skip = 0,
        int limit = 15
    );
    
    Task<Employee> GetById(string id);
    
    Task<Employee> GetByUserIdAndShopId(string userId, string shopId);
}