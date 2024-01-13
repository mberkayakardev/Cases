using AkarSoftware.PersonelTakip.Core.Utilities.Response.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract;
using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;

namespace AkarSoftware.PersonelTakip.Services.Abstract
{
    public interface IPersonelSessionService
    {
        Task<JsonResponse<PersonelAddDto>> AddPersonelAjax(PersonelAddDto Dto);
        Task<JsonResponse<List<PersonelListDto>>> GetAllPersonAjax();
        Task<IDataResults<List<PersonelListDto>>> GetAllPersons();
        Task<byte[]> GenerateAllPersonelExcelFile();


    }
}
