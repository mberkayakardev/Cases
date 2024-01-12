namespace AkarSoftware.PersonelTakip.Core.Entities.Abstract
{
    // Normal şartlar altında sistemde gerek Reflectionlar gerekse katmanlar arası kural yazmam gerektiğinde Entitylerimi Core içerisinde bu şekilde tanımlıyorum
    // ID, CreatedDate, UpdatedDate gibi alanlarımı interface olarak burada belirtiyorum

    public interface IEntity 
    {
        public string Id { get; set; }
    }
}
