namespace AkarSoftware.PersonelTakip.Core.Entities.Abstract
{
    /// Burada Entitylerim için başlangıçta yapılması gereken yapılandırmalar varsa onları yapıyorum.  <summary>
    /// Bu proje için yapılmasa dahi genel olarak backend i bu şekilde kurgularım
    /// </summary>
    public class BaseEntity : IEntity
    {
        public string Id { get ; set ; }
    }
}
