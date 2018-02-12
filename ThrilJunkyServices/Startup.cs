using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Azure.MediaServices.Core;
using IdentityServer4.AccessTokenValidation;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ThrilJunkyServices.Repositories;

namespace ThrilJunkyServices
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
            string domain = Configuration["Auth:Domain"];

            services.AddAuthentication(IdentityServerAuthenticationDefaults.AuthenticationScheme)
            .AddIdentityServerAuthentication(options =>
            {
                options.Authority = domain;
                options.ApiName = "customAPI";
            });

            services.AddMvc();

            services.AddSingleton(_ => Configuration);

            services.AddSingleton<IPostRepository, PostRepository>();

            services.AddSingleton<IMediaRepository, MediaRepository>();

            services.AddSingleton<IUserRepository, UserRepository>();

            services.AddSingleton<ITagRepository, TagRepository>();

            services.AddSingleton<IHintRepository, HintRepository>();

            services.AddSingleton<ILocationRepository, LocationRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseAuthentication();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
