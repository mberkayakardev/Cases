using AkarSoftware.PersonelTakip.Core.Entities.Abstract;

namespace AkarSoftware.PersonelTakip.Entities.Concrete
{
    public class Personel : BaseEntity
    {
        public Personel()
        {
            this.Id = Guid.NewGuid().ToString();
                 
        }
        public string Name { get; set; }
        public string SurName { get; set; }
        public string Mail { get; set; }
        public string Adress { get; set; }
    }
}
