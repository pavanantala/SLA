using System.Net;


namespace SoberLivingAmerica.Entities.ResponseModel
{
    public class ResponseModel<T>
    {
        public T Result { get; set; }
        public bool Status { get { return !HasError; } }
        public bool HasError { private get; set; }
        public string Message { get; set; }
        public HttpStatusCode StatusCode { get; set; }
    }
}
