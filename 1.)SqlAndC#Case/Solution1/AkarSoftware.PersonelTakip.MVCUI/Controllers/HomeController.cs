using Microsoft.AspNetCore.Mvc;

namespace AkarSoftware.PersonelTakip.MVCUI.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

    }
}
