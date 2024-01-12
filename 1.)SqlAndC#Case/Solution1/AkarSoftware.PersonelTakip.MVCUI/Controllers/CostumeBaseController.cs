using AkarSoftware.PersonelTakip.Core.Utilities.Response.ComplexTypes;
using Microsoft.AspNetCore.Mvc;

namespace AkarSoftware.PersonelTakip.MVCUI.Controllers
{
    public class CostumeBaseController : Controller
    {
        [NonAction]
        public IActionResult CreateActionResult<T>(JsonResponse<T> Response) // response a göre ilgili dönüşler sağlanacaktır. 
        {
            if (Response.StatusCode == 204) // No Content (delete / Update)
            {
                return new ObjectResult(null) { StatusCode = Response.StatusCode }; // OK Bad request gibi dönmeme gerek yok Object result ta datayı null yaptık 
            }

            return new ObjectResult(Response) { StatusCode = Response.StatusCode };
        }
    }
}
