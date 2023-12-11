using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Logic;
using FlixnetBackend.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using System.Text;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace FlixnetBackend
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            var app = builder.Build();

            app.MapGet("/", () => "Hello, FlixnetBackend!");

            app.Run();

            /*var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddIdentity<User, IdentityRole<Guid>>(options =>
            {
                options.Password.RequireDigit = true;
                options.Password.RequiredLength = 7;
            })
                .AddEntityFrameworkStores<DBContext>()
                .AddDefaultTokenProviders();
            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
               .AddJwtBearer(options =>
               {
                   options.TokenValidationParameters = new TokenValidationParameters
                   {
                       ValidateIssuer = true,
                       ValidateAudience = true,
                       ValidateLifetime = true,
                       ValidateIssuerSigningKey = true,
                       ValidIssuer = "http://localhost:7294",
                       ValidAudience = "http://localhost:4200",
                       IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("This is our secret key, its not very safe"))
                   };
               });
            builder.Services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder
                        .WithOrigins("http://localhost:4200")
                        .AllowAnyMethod()
                        .AllowAnyHeader();
                });
            });


            builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            ///builder.Services.AddDbContext<DBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("Default")));

            builder.Services.AddDbContext<DBContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("Default"));
            });

            RegisterInterfaces(builder);
            var app = builder.Build();

            /// Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();
            
            app.UseCors();
            app.UseAuthentication();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();*/
        }

        /*private static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddRazorPages();
            services.AddControllers();
            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();
            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder
                        .WithOrigins("http://localhost:4200")
                        .AllowAnyMethod()
                        .AllowAnyHeader();
                });
            });

            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            //services.AddDbContext<DBContext>(options => options.UseSqlServer(Configuration.GetConnectionString("Default")));
            services.AddDbContext<Business.DBContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("Default"));
            });

            RegisterInterfaces(services);
        }*/

        /*private static void ConfigureApp(WebApplicationBuilder builder)
        {
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapRazorPages();
        }*/
        private static void RegisterInterfaces(WebApplicationBuilder builder)
        {
            builder.Services.AddScoped<IMovieService, MovieService>();
            builder.Services.AddScoped<IMovieRepository, MovieRepository>();
            builder.Services.AddScoped<IUserService, UserService>();
            builder.Services.AddScoped<IUserRepository, UserRepository>();
            builder.Services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();
        }

    }
}
