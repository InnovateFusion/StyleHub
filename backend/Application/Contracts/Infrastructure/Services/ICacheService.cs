namespace backend.Application.Contracts.Infrastructure.Services;

public interface ICacheService
{

    Task Add<T>(string key, T value, TimeSpan expirationTime);
    Task<T> Get<T>(string key);
    Task Remove(string key);
    
    Task AddToSet(string key, string value);
    Task RemoveFromSet(string key, string value);
    Task<IEnumerable<string>> GetSetMembers(string key);
}