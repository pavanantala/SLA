using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Repository.DapperWrapper
{
    public interface IDapperWrapper
    {
        List<T> GetData<T>(string commandText, Dictionary<string, object> parameters);
    }
}
