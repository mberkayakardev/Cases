using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.ComplexTypes;

namespace AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract
{
    public interface IResult
    {
        public ResultStatus Status { get; }
        public string Messages { get; }
        public IEnumerable<ErrorModel> ValidationErrors { get; }
    }
}
