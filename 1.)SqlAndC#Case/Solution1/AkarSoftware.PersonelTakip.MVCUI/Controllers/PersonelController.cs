using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using AkarSoftware.PersonelTakip.Services.Abstract;
using Microsoft.AspNetCore.Mvc;

namespace AkarSoftware.PersonelTakip.MVCUI.Controllers
{
    public class PersonelController : CostumeBaseController
    {
        private readonly IPersonelSessionService _personelSessionService;

        public PersonelController(IPersonelSessionService personelSessionService)
        {
            _personelSessionService = personelSessionService;
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

            return View();
        }
    }
}
