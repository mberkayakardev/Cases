namespace AkarSoftware.PersonelTakip.Core.Utilities.Response.ComplexTypes
{
    public class JsonResponse<T>
    {
        public int StatusCode { get; set; } 
        public T Data { get; set; } 
        public List<string> Errors { get; set; }
        
        public static JsonResponse<T> SuccessResult(int statuscode, T data) // verileri listelemek gibi 
        {
            return new JsonResponse<T>() { Data = data, StatusCode = statuscode };
        }
        public static JsonResponse<T> SuccessResult(int statuscode) // illaki data dönmem gerekmeyen bir durum olabilir // Update işlemi gibi yada delete işlemi gibi geriye data dönülmez.
        {
            return new JsonResponse<T>() { StatusCode = statuscode };
        }
        public static JsonResponse<T> FailResult(List<string> Error, int statuscode) // hataları döneceğim alan. 
        {
            return new JsonResponse<T>() { StatusCode = statuscode, Errors = Error };
        }

        public static JsonResponse<T> FailResult(string Error, int statuscode) // Bazen tek bir hata gelebilir (yani operasyonel bir süreç olabilir validasyon hatasından ziyade)
        {
            return new JsonResponse<T>() { StatusCode = statuscode, Errors = new() { Error } };
        }
    }
}
