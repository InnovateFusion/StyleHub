using backend.Application.Contracts.Infrastructure.Services;
using System.Text.Json;
using StackExchange.Redis;

namespace backend.Infrastructure.Repository
{
    public class CacheService(IConnectionMultiplexer redis) : ICacheService
    {
        public async Task Add<T>(string key, T value, TimeSpan expirationTime = default)
        {
            var db = redis.GetDatabase();
            await db.StringSetAsync(key, JsonSerializer.Serialize(value), expirationTime);
        }

        public async Task<T> Get<T>(string key)
        {
            var db = redis.GetDatabase();
            var value = await db.StringGetAsync(key);
            return JsonSerializer.Deserialize<T>(value);
        }

        public async Task Remove(string key)
        {
            var db = redis.GetDatabase();
            await db.KeyDeleteAsync(key);
        }
        
        public async Task AddToSet(string key, string value)
        {
            var db = redis.GetDatabase();
            await db.SetAddAsync(key, value);
        }
        
        public async Task RemoveFromSet(string key, string value)
        {
            var db = redis.GetDatabase();
            await db.SetRemoveAsync(key, value);
        }
        
        public async Task<IEnumerable<string>> GetSetMembers(string key)
        {
            var db = redis.GetDatabase();
            return db.SetMembers(key).Select(x => x.ToString());
        }
        
    }
}