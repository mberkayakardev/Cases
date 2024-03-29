﻿using AkarSoftware.PersonelTakip.Core.Dtos.Abstract;

namespace AkarSoftware.PersonelTakip.Dtos.Concrete.Personel
{
    public class PersonelUpdateDto : BaseUpdateDto
    {
        public string Name { get; set; }
        public string SurName { get; set; }
        public string Mail { get; set; }
        public string Adress { get; set; }
    }
}
