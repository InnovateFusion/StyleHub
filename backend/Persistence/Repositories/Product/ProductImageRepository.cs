using backend.Application.Contracts.Persistence.Repositories.Product;
using backend.Domain.Entities.Product;
using backend.Persistence.Configuration;
using backend.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;

namespace backend.Persistence.Repositories.Product;

public class ProductImageRepository(StyleHubDBContext context)
    : GenericRepository<ProductImage>(context), IProductImageRepository
{
    public async Task<ProductImage> GetById(string id)
    {
        var productimage = await context.ProductImages.FirstOrDefaultAsync(u => u.Id == id);
        return productimage!;
    }

    public async Task<bool> DeleteByProductId(string productId)
    {
        var productimages = await context.ProductImages.Where(u => u.ProductId == productId).ToListAsync();
        context.ProductImages.RemoveRange(productimages);
        await context.SaveChangesAsync();
        return true;
    }
}