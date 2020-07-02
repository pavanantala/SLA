using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SoberLivingAmerica.Database;
using SoberLivingAmerica.Database.Helper;
using SoberLivingAmerica.Database.IHelper;
using SoberLivingAmerica.Database.Tables;
using SoberLivingAmerica.Services.Helpers;
using SoberLivingAmerica.Web.CoreHelper;

namespace SoberLivingAmerica.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
            services.AddDbContextPool<ApplicationDbContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddIdentityCore<ApplicationUser>();
            // Register Dependencies
            services.AddAppServices();
            //services.AddScoped<IUserStore<IdentityUser>, ApplicationDbContext>();
            //services.AddSingleton<IUserService, UserService>();
            //services.AddScoped<IUserService, UserService>();
            //services.AddScoped<IUserService>(sp => sp.GetService<UserService>());

            services.AddIdentity<ApplicationUser, IdentityRole>(options =>
            {
                options.User.RequireUniqueEmail = true;
            })
           .AddRoles<IdentityRole>()
           .AddEntityFrameworkStores<ApplicationDbContext>()
           .AddDefaultTokenProviders();

            services.ConfigureApplicationCookie(option =>
            {
                option.LoginPath = "/Login/Index";
                option.AccessDeniedPath = "/Login/AccessDenied";
            });

            // Register dependancy
            RegisterAutoMapper(services);
            RegisterRepository(services);
            RegisterServices(services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseAuthentication();
            app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }

        private void RegisterRepository(IServiceCollection services)
        {
            // Get class library
            var repositoryLibraries = Assembly.Load("SoberLivingAmerica.Repository")
                .GetTypes()
                .Where(x => x.IsClass && x.GetInterfaces().Any() && x.Namespace.Contains(".Repository.Repository"))
                .ToList();

            if (repositoryLibraries != null && repositoryLibraries.Count > 0)
            {
                foreach (var repository in repositoryLibraries)
                {
                    var interfaceType = repository.GetInterfaces().FirstOrDefault();
                    services.AddScoped(interfaceType, repository);
                }
            }
        }

        private void RegisterServices(IServiceCollection services)
        {
            // Get class libraryGetAssembly(ty)
            var serviceLibraries = Assembly.Load("SoberLivingAmerica.Services")
                .GetTypes()
                .Where(x => x.IsClass && x.GetInterfaces().Any() && x.Namespace.Contains(".Services.Services"))
                .ToList();

            if (serviceLibraries != null && serviceLibraries.Count > 0)
            {
                foreach (var service in serviceLibraries)
                {
                    var interfaceType = service.GetInterfaces().FirstOrDefault();
                    services.AddScoped(interfaceType, service);
                }
            }
        }

        private void RegisterAutoMapper(IServiceCollection services)
        {
            // Auto Mapper Configurations
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MappingProfile());
            });

            IMapper mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);
        }
    }
}
