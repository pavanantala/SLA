using Microsoft.Extensions.DependencyInjection;
using SoberLivingAmerica.Database;
using SoberLivingAmerica.Database.Data;
using SoberLivingAmerica.Database.Data.Extensions;
using SoberLivingAmerica.Database.Helper;
using SoberLivingAmerica.Database.IHelper;
using SoberLivingAmerica.Repository;
using SoberLivingAmerica.Services.IServices;
using SoberLivingAmerica.Services.Services;

namespace SoberLivingAmerica.Web.CoreHelper
{
    public static class AppServiceCollectionExtensions
    {
        public static IServiceCollection AddAppServices(this IServiceCollection services)
        {
            services.AddTransient(typeof(ICustomRepository<>), typeof(EfRepository<>));
            services.AddTransient(typeof(IDbContext), typeof(ApplicationDbContext));
            services.AddScoped(typeof(IDataProvider), typeof(SqlServerDataProvider));

            return services;
        }
    }
}
