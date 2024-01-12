using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.ComplexTypes;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.Abstract;
using AkarSoftware.PersonelTakip.Core.Utilities.Result.ComplexTypes;

namespace AkarSoftware.PersonelTakip.Core.Utilities.Result.Concrete
{
    public class Result : IResult
    {
        public ResultStatus Status { get; set; }
        public string Messages { get; set; }
        public IEnumerable<ErrorModel> ValidationErrors { get; set; }
        public Result(ResultStatus status, string StatusMessages, IEnumerable<ErrorModel> Errors) : this(status, StatusMessages)
        {
            ValidationErrors = Errors;
        }

        public Result(ResultStatus status, string StatusMessages) : this(status)
        {
            this.Messages = StatusMessages;
        }

        public Result(ResultStatus status)
        {
            this.Status = status;
        }

        public Result(ResultStatus status, IEnumerable<ErrorModel> Errors) : this(status, string.Empty, Errors)
        {

        }
    }
}
