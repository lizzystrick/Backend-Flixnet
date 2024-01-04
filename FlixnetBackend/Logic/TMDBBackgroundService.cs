using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;
using System.Threading;
using System.Threading.Tasks;

namespace FlixnetBackend.Logic
{
    public class TMDBBackgroundService 
    {
        private readonly IHttpClientFactory _httpClientFactory;
        // Add other dependencies as needed

    }
}
