using AutoMapper;
using LinkedUp.API.Core;
using LinkedUp.API.UploadFiles;
using LinkedUp.Application.UseCases.Commands.Interaction;
using LinkedUp.Application.UseCases.Commands.Posts;
using LinkedUp.Application.UseCases.Commands.Users;
using LinkedUp.Application.UseCases.Queries;
using LinkedUp.Application.UseCases.Queries.Posts;
using LinkedUp.Application.UseCases.Users;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using LinkedUp.Implementation.Profiles;
using LinkedUp.Implementation.UseCases.Commands.Interactions;
using LinkedUp.Implementation.UseCases.Commands.Posts;
using LinkedUp.Implementation.UseCases.Commands.Users;
using LinkedUp.Implementation.UseCases.Queries;
using LinkedUp.Implementation.UseCases.Queries.Posts;
using LinkedUp.Implementation.UseCases.Users;
using LinkedUp.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.API.Extensions
{
    public static class ContainerExtensions
    {
        public static void AddJwt(this IServiceCollection services, AppSettings settings)
        {
            services.AddTransient(x =>
            {
                var context = x.GetService<LinkedUpContext>();
                var settings = x.GetService<AppSettings>();

                return new JwtManager(context, settings.JwtSettings);
            });


            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = settings.JwtSettings.Issuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(settings.JwtSettings.SecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
        public static void AddApplicationUser(this IServiceCollection services)
        {
            services.AddTransient<IApplicationUser>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var header = accessor.HttpContext.Request.Headers["Authorization"];

                //Pristup payload-u
                var claims = accessor.HttpContext.User;

                if (claims == null || claims.FindFirst("UserId") == null)
                {
                    return new AnonimousUser();
                }

                var actor = new JwtUser
                {
                    Email = claims.FindFirst("Email").Value,
                    Id = Int32.Parse(claims.FindFirst("UserId").Value),
                    Identity = claims.FindFirst("Email").Value,
                    // "[1, 2, 3, 4, 5]"
                    UseCaseIds = JsonConvert.DeserializeObject<List<int>>(claims.FindFirst("UseCases").Value),
                    IsAdmin = bool.Parse(claims.FindFirst("Admin").Value)
                };

                return actor;
            });
        }
        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<ICreateUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IGetPostsQuery, EfGetPostsQuery>();
            services.AddTransient<IGetOnePostQuery, EfGetOnePostQuery>();
            services.AddTransient<IUploadFile, UploadFile>();
            services.AddTransient<ICreatePostCommand, EfCreatePostCommand>();
            services.AddTransient<IDeletePostCommand, EfDeletePostCommand>();
            services.AddTransient<ICreateInteractionCommand, EfCreateInteractionCommand>();
            services.AddTransient<IDeleteInteractionCommand, EfDeleteInteractionCommand>();
            services.AddTransient<ISearchLogsQuery, EfSearchLogsQuery>();
            //validators 

            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<CreatePostValidator>();
            services.AddTransient<CreateInteractionValidator>();
            
        }
        public static void AddLinkedUpDbContext(this IServiceCollection services)
        {
            services.AddTransient(x =>
            {
                var optionsBuilder = new DbContextOptionsBuilder();
                var conString = x.GetService<AppSettings>().ConnString;
                optionsBuilder.UseSqlServer(conString).UseLazyLoadingProxies();
                var options = optionsBuilder.Options;
                return new LinkedUpContext(options);
            });
        }
        public static void AddAutoMapper(this IServiceCollection services)
        {
            services.AddSingleton(provider => new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new UserProfile());
                cfg.AddProfile(new ConnectionProfile());
                cfg.AddProfile(new UserUseCaseProfile());
                cfg.AddProfile(new InteractionProfile());
                cfg.AddProfile(new PostProfile());
                cfg.AddProfile(new MediaProfil());
            }).CreateMapper());
        }
    }
}
