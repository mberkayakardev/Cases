using AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.ComplexTypes;
using FluentValidation.Results;

namespace AkarSoftware.PersonelTakip.Core.Extentions.FluentValidation.Concrete
{
    public static class FluentValidationExtentions
    {
        public static List<ErrorModel> GetErrors(this ValidationResult result)
        {
            var errors = new List<ErrorModel>();
            foreach (var item in result.Errors)
            {
                errors.Add(new ErrorModel { Description = item.ErrorMessage, PropertyName = item.PropertyName });   

            }
            return errors;
        }
        public static List<string> GetErrorsStrings(this ValidationResult result)
        {
            var errors = new List<string>();
            foreach (var item in result.Errors)
            {
                errors.Add(item.ErrorMessage);
            }
            return errors;
        }
    }
}
