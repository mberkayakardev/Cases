namespace AkarSoftware.PersonelTakip.Core.Dtos.Abstract
{
    // Update işlemlerimin hepsinde id zorunludur bu sebeple bir ayrıştırma yapmak istedim.
    public class BaseUpdateDto : BaseDto, IUpdateDto
    {
        public string Id { get; set; }
    }
}
