using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using FluentValidation;

namespace AkarSoftware.PersonelTakip.Services.Concrete.ValidationRules.Personel
{
    public class PersonelUpdateDtoValidatonRules : AbstractValidator<PersonelUpdateDto>
    {
        public PersonelUpdateDtoValidatonRules()
        {
            RuleFor(x => x.Adress).NotEmpty().WithMessage("Adress alanı boş olamaz");
            RuleFor(x => x.SurName).NotEmpty().WithMessage("Soyad alanı boş olamaz");
            RuleFor(x => x.Mail).NotEmpty().WithMessage("Mail alanı boş olamaz");
            RuleFor(x => x.Name).NotEmpty().WithMessage("Personel Ad alanı boş olamaz");
        }
    }
}
