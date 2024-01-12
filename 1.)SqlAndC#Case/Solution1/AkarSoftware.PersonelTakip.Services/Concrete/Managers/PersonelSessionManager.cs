using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.Concrete;
using AkarSoftware.PersonelTakip.Core.Utilities.Response.ComplexTypes;
using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using AkarSoftware.PersonelTakip.Entities.Concrete;
using AkarSoftware.PersonelTakip.Services.Abstract;
using AkarSoftware.PersonelTakip.Services.Concrete.ConstVerables;
using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Http;

namespace AkarSoftware.PersonelTakip.Services.Concrete.Managers
{
    public class PersonelSessionManager : BaseManager, IPersonelSessionService
    {
        private string Personellistkey = "ListPersonel";

        private readonly IValidator<PersonelAddDto> _AddDtoValidator;
        private readonly IValidator<PersonelUpdateDto> _UpdateValidator;

        private readonly IHttpContextAccessor _Context;
        private readonly ISessionService _sessionService;
        public PersonelSessionManager(IMapper mapper, IHttpContextAccessor context, ISessionService sessionService, IValidator<PersonelAddDto> validatorAddDto) : base(mapper)
        {
            _Context = context;
            _sessionService = sessionService;
            _AddDtoValidator = validatorAddDto;
        }

      

        public async Task<JsonResponse<PersonelAddDto>> AddPersonelAjax(PersonelAddDto Dto)
        {
            var validationResult = _AddDtoValidator.Validate(Dto);
            if (validationResult.IsValid)
            {
                var Entity = _mapper.Map<Personel>(Dto);
                _sessionService.AddItemInList<Personel>(Personellistkey,Entity);
                return JsonResponse<PersonelAddDto>.SuccessResult(201);

            }
            return JsonResponse<PersonelAddDto>.FailResult(validationResult.GetErrorsStrings(), 400);
        }

        public async Task<JsonResponse<List<PersonelListDto>>> GetAllPersonAjax()
        {
            var AllPersons = _sessionService.GetList<Personel>(Personellistkey);
            if (AllPersons != null && AllPersons.Count > 0)
            {
                var mappingData = _mapper.Map<List<PersonelListDto>>(AllPersons);
                return JsonResponse<List<PersonelListDto>>.SuccessResult( 200  , mappingData);
            }
            return JsonResponse<List<PersonelListDto>>.FailResult(Messages.Status.Notfound, 404);
        }
    }
}
