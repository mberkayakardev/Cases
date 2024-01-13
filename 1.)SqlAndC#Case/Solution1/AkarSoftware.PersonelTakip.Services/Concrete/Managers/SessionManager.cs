using AkarSoftware.PersonelTakip.Core.Extentions.Session;
using AkarSoftware.PersonelTakip.Services.Abstract;
using Microsoft.AspNetCore.Http;

namespace AkarSoftware.PersonelTakip.Services.Concrete.Managers
{
    public class SessionManager : ISessionService
    {
        private readonly IHttpContextAccessor httpContextAccessor;
        public SessionManager(IHttpContextAccessor httpContextAccessor)
        {
            this.httpContextAccessor = httpContextAccessor;
        }

        public void AddItemInList<T>(string key, T item)
        {
            var itemlist = httpContextAccessor.HttpContext.Session.GetObject<List<T>>(key);
            if (itemlist == null)
            {
                itemlist = new List<T>();
            }
            itemlist.Add(item);
            httpContextAccessor.HttpContext.Session.SetObject(key, itemlist);

        }
        public List<T> GetList<T>(string key)
        {
            var itemlist = httpContextAccessor.HttpContext.Session.GetObject<List<T>>(key);
            return itemlist;
        }

    }
}
