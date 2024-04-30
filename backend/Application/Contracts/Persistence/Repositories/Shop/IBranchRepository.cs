using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Domain.Entities.Shop;

namespace backend.Application.Contracts.Persistence.Repositories.Shop;

public interface IBranchRepository: IGenericRepository<Branch>
{
    Task<IReadOnlyList<Branch>> GetAll(
        string? shopId = null,
        string? sortBy = null,
        string? sortOrder = null,
        int skip = 0,
        int limit = 15
    );

    Task<Branch> GetById(string id);
}