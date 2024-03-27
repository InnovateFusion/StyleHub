using Application.Contracts;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Persistence.Repositories
{
    public class BrandRepository : GenericRepository<Brand>, IBrandRepository
    {
        StyleHubDBContext _context;
        public BrandRepository(StyleHubDBContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<Brand>> GetAll()
        {
            return await _context.Brands.ToListAsync();
        }

        public async Task<Brand> GetById(string id)
        {
            var user = await _context.Brands.FirstOrDefaultAsync(u => u.Id == id);
            return user!;
        }

        public async Task<Brand> GetByName(string name)
        {
            var brand = await _context.Brands.FirstOrDefaultAsync(u => u.Name == name);
            return brand!;
        }

    }
}