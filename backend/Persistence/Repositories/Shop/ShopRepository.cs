using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using ArgumentException = backend.Application.Exceptions.ArgumentException;

namespace backend.Persistence.Repositories.Shop;

public class ShopRepository(StyleHubDBContext context)  : GenericRepository<Domain.Entities.Shop.Shop>(context),
    IShopRepository
{
    public async Task<IReadOnlyList<Domain.Entities.Shop.Shop>> GetAll(string? search = null, double? latitude = null, double? longitude = null, double? radius = null,
        string? sortBy = null, string? sortOrder = null, int skip = 0, int limit = 15)
    {        
        var query = context.Shops.AsSplitQuery()
            .AsNoTracking();
        
        if (!string.IsNullOrEmpty(search))
        {
            query =  query.Where(p =>
                EF.Functions.Like(p.Name, $"%{search}%")
                || EF.Functions.Like(p.Description, $"%{search}%")
                || EF.Functions.Like(p.ServiceType, $"%{search}%")
                || EF.Functions.Like(p.City, $"%{search}%")
                || EF.Functions.Like(p.Website, $"%{search}%")
                || EF.Functions.Like(p.Email, $"%{search}%")
                || EF.Functions.Like(p.PhoneNumber, $"%{search}%")
                || EF.Functions.Like(p.Website, $"%{search}%")
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

    public async Task<Domain.Entities.Shop.Shop> GetById(string id)
    {
        var result = await context.Shops.AsNoTracking().FirstOrDefaultAsync(p => p.Id == id);
        return result!;
    }
    
    public async Task<List<Domain .Entities.Common.Image>> GetShopImage(string shopId)
    {
        var shop = await context.Products
            .Include(p => p.ProductImages)
            .ThenInclude(pi => pi.Image)
            .AsSplitQuery()
            .AsNoTracking()
            .FirstOrDefaultAsync(p => p.Id == shopId);

        if (shop != null && shop.ProductImages.Any())
        {
            // Extracting all images associated with the shop
            var images = shop.ProductImages.Select(pi => pi.Image).ToList();
            return images;
        }
        else
        {
            return new List<Domain.Entities.Common.Image>();
        }
    }
}


