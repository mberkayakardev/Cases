using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace AkarSoftware.PersonelTakip.Core.Extentions.Session
{
    public static class SessionExtentionsMethods
    {

        // ilgili key ile tipi kaydet
        public static void SetObject(this ISession session, string key, object value )
        {
            string objectstring = JsonConvert.SerializeObject(value);
            session.SetString(key, objectstring);
         
        }

        // ilgili key ve Tip için değer varsa ilgili değeri getir 
        public static T GetObject<T>(this ISession session, string key) where T : class
        {
            var objectstring = session.GetString(key); // Session da değer varmı ? 
            if (string.IsNullOrEmpty(objectstring))
            {
                return null;
            }
            T item = JsonConvert.DeserializeObject<T>(objectstring);
            return item;

        }


    }
}
