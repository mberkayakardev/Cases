using AkarSoftware.PersonelTakip.Core.Dtos.Abstract;

namespace AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract
{
    public interface IDataResults<T> : IResult 
    {
        T Data { get; }
    }
}
