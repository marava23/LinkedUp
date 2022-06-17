using AutoMapper;
using LinkedUp.API.Core;
using LinkedUp.API.Extensions;
using LinkedUp.Application.Emails;
using LinkedUp.Application.Logging;
using LinkedUp.Implementation;
using LinkedUp.Implementation.Emails;
using LinkedUp.Implementation.Logging;
using LinkedUp.Implementation.Profiles;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System;
using System.Reflection;
using System.IO;
using Microsoft.OpenApi.Models;

namespace LinkedUp.API
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
            var settings = new AppSettings();

            Configuration.Bind(settings);
            services.AddSingleton(settings);
            services.AddApplicationUser();
            services.AddJwt(settings);
            services.AddLinkedUpDbContext();
            services.AddUseCases();
            services.AddTransient<IUseCaseLogger, EfUseCaseLogger>();
            services.AddTransient<IExceptionLogger, EfExceptionlogger>();
            services.AddTransient<UseCaseHandler>();
            services.AddTransient<IEmailSender>(x =>
            new SmtpEmailSender(settings.EmailOptions.FromEmail,
                                settings.EmailOptions.Password,
                                settings.EmailOptions.Port,
                                settings.EmailOptions.Host));
            services.AddAutoMapper();
            services.AddControllers();
            services.AddHttpContextAccessor();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "LinkedUp API",
                    Description = "Simple Blog API, users create posts and interact",
                    
                });
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                c.IncludeXmlComments(xmlPath);
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger(c =>
                {
                    c.SerializeAsV2 = true;
                });
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
                    c.RoutePrefix = string.Empty;
                });
            }

            app.UseRouting();
            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
