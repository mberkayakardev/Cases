using AkarSoftware.PersonelTakip.Core.Dtos.Abstract;
using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.ComplexTypes;

namespace AkarSoftware.PersonelTakip.Core.Utilities.Result.Concrete
{
    public class DataResult<T> : Result, IDataResults<T> 
    {
        public T Data { get; set; }
        public DataResult(T data, ResultStatus status, string Messages) : base(status, Messages)
        {
            this.Data = data;
        }
        public DataResult(T data, ResultStatus status) : base(status)
        {
            this.Data = data;

        }
        public DataResult(T data, ResultStatus status, IEnumerable<ErrorModel> Errors) : base(status, "", Errors)
        {
            this.Data = data;

        }
    }
}
