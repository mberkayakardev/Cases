using AkarSoftware.PersonelTakip.Core.Utilities.Result.ComplexTypes;
using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using AkarSoftware.PersonelTakip.Services.Abstract;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;

namespace AkarSoftware.PersonelTakip.MVCUI.Controllers
{
    public class PersonelController : CostumeBaseController
    {
        private readonly IPersonelSessionService _personelSessionService;
        private readonly INotyfService _notyf;

        public PersonelController(IPersonelSessionService personelSessionService, INotyfService notyf)
        {
            _personelSessionService = personelSessionService;
            _notyf = notyf;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody]PersonelAddDto dto)
        {
            var result = await _personelSessionService.AddPersonelAjax(dto);
            return this.CreateActionResult(result);
        }

        [HttpGet]
        public async Task<IActionResult> GetAllPersons()
        {
            var result = await _personelSessionService.GetAllPersonAjax();
            return this.CreateActionResult(result);
        }

        [HttpGet]
        public async Task<IActionResult> GetAllPersonsWithAjax()
        {
            var result = await _personelSessionService.GetAllPersonAjax();
            return this.CreateActionResult(result);
        }

        [HttpGet]
        public async Task<IActionResult> CreatePersonsXML()
        {
            var result = await _personelSessionService.GetAllPersonAjax();
            if (result.StatusCode== 200)
            {
                var resultFile = await _personelSessionService.GenerateAllPersonelExcelFile(result.Data);
                return File(resultFile, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Personeller.xlsx");
            }
            else
            {
                _notyf.Error("Sistemde kayıtlı herhangi bir personel bulunamadı. Lütfen personel kaydı oluşturunuz");
                return View("Index");
            }
        }
    }
}
