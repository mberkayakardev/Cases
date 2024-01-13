using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.Concrete;
using AkarSoftware.PersonelTakip.Core.Utilities.Response.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.Concrete;
using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using AkarSoftware.PersonelTakip.Entities.Concrete;
using AkarSoftware.PersonelTakip.Services.Abstract;
using AkarSoftware.PersonelTakip.Services.Concrete.ConstVerables;
using AutoMapper;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
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
 
        public async Task<byte[]> GenerateAllPersonelExcelFile(List<PersonelListDto> dto)
        {

            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Create(memoryStream, SpreadsheetDocumentType.Workbook))
                {
                    WorkbookPart workbookPart = spreadsheetDocument.AddWorkbookPart();
                    workbookPart.Workbook = new Workbook();

                    Sheets sheets = spreadsheetDocument.WorkbookPart.Workbook.AppendChild(new Sheets());
                    WorksheetPart worksheetPart = workbookPart.AddNewPart<WorksheetPart>();
                    Sheet sheet = new Sheet() { Id = spreadsheetDocument.WorkbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = "PersonelListesi" };
                    sheets.Append(sheet);

                    Worksheet worksheet = new Worksheet();
                    SheetData sheetData = new SheetData();
                    worksheet.Append(sheetData);

                    // Başlık satırını ekleyin
                    Row headerRow = new Row();
                    headerRow.Append(CreateCell("ID"));
                    headerRow.Append(CreateCell("Adı"));
                    headerRow.Append(CreateCell("Soyadı"));
                    headerRow.Append(CreateCell("Email"));
                    headerRow.Append(CreateCell("Adres"));

                    sheetData.AppendChild(headerRow);

                    foreach (var personel in dto)
                    {
                        Row dataRow = new Row();
                        dataRow.Append(CreateCell(personel.Id.ToString()));
                        dataRow.Append(CreateCell(personel.Name));
                        dataRow.Append(CreateCell(personel.SurName));
                        dataRow.Append(CreateCell(personel.Mail));
                        dataRow.Append(CreateCell(personel.Adress));
                        sheetData.AppendChild(dataRow);
                    }

                    worksheetPart.Worksheet = worksheet;
                }

                return memoryStream.ToArray();
            }
        }

        private Cell CreateCell(string text)
        {
            return new Cell() { DataType = CellValues.String, CellValue = new CellValue(text) };
        }
    }
}
