using AutoMapper;

namespace AkarSoftware.PersonelTakip.Services.Abstract
{
    public class BaseManager
    {

        protected readonly IMapper _mapper;
        public BaseManager(IMapper mapper)
        {
            _mapper = mapper;
        }

    }
}
