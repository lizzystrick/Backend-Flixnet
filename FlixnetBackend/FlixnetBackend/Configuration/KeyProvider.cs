using Microsoft.Extensions.Configuration;
using System.IO;

namespace FlixnetBackend.Configuration
{
    public static class KeyProvider
    {
        public static string GetSecretKey()
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            return configuration.GetSection("Jwt:Key").Value;
        }
    }
}
