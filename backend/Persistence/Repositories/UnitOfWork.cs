using backend.Application.Contracts.Persistence;
using backend.Application.Contracts.Persistence.Repositories.Common;
using backend.Application.Contracts.Persistence.Repositories.Product;
using backend.Application.Contracts.Persistence.Repositories.Shop;
using backend.Application.Contracts.Persistence.Repositories.User;
using backend.Persistence.Configuration;

namespace backend.Persistence.Repositories
{
    public class UnitOfWork(
        StyleHubDBContext context,
        IProductRepository productRepository,
        IColorRepository colorRepository,
        ISizeRepository sizeRepository,
        IBrandRepository brandRepository,
        IMaterialRepository materialRepository,
        IProductColorRepository productColorRepository,
        IProductSizeRepository productSizeRepository,
        IProductMaterialRepository productMaterialRepository,
        ILocationRepository locationRepository,
        ICategoryRepository categoryRepository,
        IProductCategoryRepository productCategoryRepository,
        IRoleRepository roleRepository,
        IUserRepository userRepository,
        IChatRepository chatRepository,
        IImageRepository imageRepository,
        IProductImageRepository productImageRepository,
        IReviewRepository reviewRepository,
        IShopRepository shopRepository,
        ISubscriberRepository subscriberRepository,
        IEmployeeRepository employeeRepository,
        IBranchRepository branchRepository
        )
    
        : IUnitOfWork
    {
        public IProductRepository ProductRepository => productRepository;

        public IColorRepository ColorRepository => colorRepository;

        public ISizeRepository SizeRepository => sizeRepository;

        public IBrandRepository BrandRepository => brandRepository;

        public IMaterialRepository MaterialRepository => materialRepository;

        public IProductColorRepository ProductColorRepository => productColorRepository;

        public IProductSizeRepository ProductSizeRepository => productSizeRepository;

        public IProductMaterialRepository ProductMaterialRepository => productMaterialRepository;

        public ILocationRepository LocationRepository => locationRepository;

        public ICategoryRepository CategoryRepository => categoryRepository;

        public IProductCategoryRepository ProductCategoryRepository => productCategoryRepository;

        public IProductImageRepository ProductImageRepository => productImageRepository;

        public IRoleRepository RoleRepository => roleRepository;

        public IUserRepository UserRepository => userRepository;

        public IImageRepository ImageRepository => imageRepository;

        public IChatRepository ChatRepository => chatRepository;

        public IReviewRepository ReviewRepository => reviewRepository;

        public IShopRepository ShopRepository => shopRepository;

        public ISubscriberRepository SubscriberRepository => subscriberRepository;

        public IEmployeeRepository EmployeeRepository => employeeRepository;
        
        public IBranchRepository BranchRepository => branchRepository;

        public void Dispose()
        {
            context.Dispose();
            GC.SuppressFinalize(this);
        }

        public async Task<int> Save()
        {
            return await context.SaveChangesAsync();
        }
    }
}
