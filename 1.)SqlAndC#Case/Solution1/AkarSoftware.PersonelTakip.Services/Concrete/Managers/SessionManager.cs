using AkarSoftware.PersonelTakip.Core.Extentions.Session;
using AkarSoftware.PersonelTakip.Services.Abstract;
using Microsoft.AspNetCore.Http;
using System.Linq.Expressions;

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



        #region Test Edilecek 

        public void RemoveItemInList<T>(string key, T item)
        {
            var itemlist = httpContextAccessor.HttpContext.Session.GetObject<List<T>>(key);
        }
        public T GetItem<T>(string key, Expression<Func<T, bool>> Where)
        {
            throw new NotImplementedException();
        }
        public void UpdateItemInList(string key, object item)
        {
            throw new NotImplementedException();
        }

        #endregion

    }
}
