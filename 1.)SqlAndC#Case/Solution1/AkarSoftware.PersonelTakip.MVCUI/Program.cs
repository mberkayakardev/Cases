using AkarSoftware.PersonelTakip.Services.Concrete.DependencyResolves.MicrosoftIOC;
using Microsoft.Extensions.FileProviders;


var builder = WebApplication.CreateBuilder(args);

#region Services
builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
builder.Services.AddCostumeDependencies();
#endregion


var app = builder.Build();

#region Middlewares

if (app.Environment.IsDevelopment())
    app.UseDeveloperExceptionPage();
else
{
    app.UseExceptionHandler("/exception");
    app.UseHsts();   
}

// Costume Status Page eklendi 
app.UseStatusCodePagesWithReExecute("/error", "?statusCode={0}");

// Http yönlendirmesi yapıldı
app.UseHttpsRedirection();

// wwwroot dışarı açıldı
app.UseStaticFiles();

// node_modules klasörü projeye eklendi ve dışarı açıldı
app.UseStaticFiles(new StaticFileOptions {RequestPath="/node_modules", FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(),"node_modules"))});

// routing middleware eklendi
app.UseRouting();

// Session eklendi
app.UseSession();

// Endpointler eklendi
app.UseEndpoints( endpoint => endpoint.MapDefaultControllerRoute());

#endregion

app.Run();