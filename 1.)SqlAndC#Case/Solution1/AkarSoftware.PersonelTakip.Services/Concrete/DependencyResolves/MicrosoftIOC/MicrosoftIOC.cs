using AkarSoftware.PersonelTakip.Services.Abstract;
using AkarSoftware.PersonelTakip.Services.Concrete.Managers;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace AkarSoftware.PersonelTakip.Services.Concrete.DependencyResolves.MicrosoftIOC
{
    public static class MicrosoftIOC
    {
        public static void AddCostumeDependencies(this IServiceCollection services)
        {
            AddConfiguration(services);

            AddServices(services);

            AddMappingConfiguration(services);

            AddValidationConfiguration(services);
        }

        /// <summary>
        /// Uygulama için service ayarları buradan yapılacaktır
        /// </summary>
        private static void AddConfiguration(IServiceCollection services)
        {
            services.AddSession();
        }

        /// <summary>
        /// Uygulamamızdaki Eklenmesi gereken Service ler burada tanımlanacaktır. 
        /// </summary>
        private static void AddServices(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IPersonelSessionService, PersonelSessionManager>();
            services.AddScoped<ISessionService, SessionManager>(); // Session için business işlemleri buradan gerçekleşecek
        }

        private static void AddMappingConfiguration(IServiceCollection services)
        {
            services.AddAutoMapper(Assembly.GetExecutingAssembly());
        }

        private static void AddValidationConfiguration(IServiceCollection services)
        {
            #region Fluent Validation Otomatik Register
            var assemblyList = Assembly.GetExecutingAssembly().GetTypes().Where(x => x.BaseType != null).Where(x => x.BaseType.Name.Contains("AbstractValidator")).ToList();
            foreach (var item in assemblyList)
            {
                var DtoType = item.BaseType.GetGenericArguments()[0];
                services.AddSingleton(typeof(IValidator<>).MakeGenericType(DtoType), item);
            }
            #endregion
        }
    }
}
