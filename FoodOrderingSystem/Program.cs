using FoodOrderApp.Data;
using Microsoft.EntityFrameworkCore;

namespace FoodOrderingSystem
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // 1. Register DbContext with MySQL
            builder.Services.AddDbContext<AppDbContext>(options =>
                options.UseMySql(
                    builder.Configuration.GetConnectionString("DefaultConnection"),
                    new MySqlServerVersion(new Version(8, 0, 34))
                ));

            // 2. Add HttpContextAccessor (for accessing session)
            builder.Services.AddHttpContextAccessor();

            // 3. Add Session services
            builder.Services.AddDistributedMemoryCache(); // required for session
            builder.Services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(30); // session timeout
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });

            // 4. Add MVC
            builder.Services.AddControllersWithViews();

            var app = builder.Build();

            // 5. Middleware
            app.UseStaticFiles();
            app.UseRouting();

            app.UseSession(); // MUST come before Authorization or MVC routing

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
