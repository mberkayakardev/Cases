using System.Linq.Expressions;

namespace AkarSoftware.PersonelTakip.Services.Abstract
{
    public interface ISessionService
    {
        void AddItemInList<T>(string key, T item);
        List<T> GetList<T>(string key);
    }
}
