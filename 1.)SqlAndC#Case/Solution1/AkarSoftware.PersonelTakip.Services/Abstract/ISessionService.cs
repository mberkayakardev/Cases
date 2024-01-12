using System.Linq.Expressions;

namespace AkarSoftware.PersonelTakip.Services.Abstract
{
    public interface ISessionService
    {
        void AddItemInList<T>(string key, T item);
        List<T> GetList<T>(string key);
        void RemoveItemInList<T>(string key, T item);
        T GetItem<T>(string key, Expression<Func<T, bool>> Where);
        void UpdateItemInList(string key, object item);

    }
}
