using AkarSoftware.PersonelTakip.Dtos.Concrete.Personel;
using AkarSoftware.PersonelTakip.Entities.Concrete;
using AutoMapper;

namespace AkarSoftware.PersonelTakip.Services.Concrete.MappingProfiles.PersonelMappingProfile
{
    public class PersonelMappingProfiles : Profile
    {
        public PersonelMappingProfiles()
        {
            CreateMap<Personel, PersonelAddDto>().ReverseMap();
            CreateMap<Personel, PersonelUpdateDto>().ReverseMap();
            CreateMap<Personel, PersonelListDto>().ReverseMap();

        }
    }
}
