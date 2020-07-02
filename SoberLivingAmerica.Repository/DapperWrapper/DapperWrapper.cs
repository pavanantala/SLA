using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace SoberLivingAmerica.Repository.DapperWrapper
{
    public class DapperWrapper : IDapperWrapper
    {
        #region Fields / Property
        private readonly IDbConnection dbConnection;
        #endregion

        #region Constructions
        public DapperWrapper(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }
        #endregion

        #region Methods
        public List<T> GetData<T>(string commandText, Dictionary<string, object> parameters)
        {
            List<T> result;
            if (parameters == null)
            {
                result = dbConnection.Query<T>(commandText).ToList();
            }
            else
            {
                DynamicParameters dynamicParameters = GetDynamicParameters(parameters);
                result = dbConnection.Query<T>(commandText, param: dynamicParameters, commandType: CommandType.StoredProcedure).ToList();
            }

            return result;
        }

        private DynamicParameters GetDynamicParameters(Dictionary<string, object> parameters)
        {
            DynamicParameters dynamicParameters = new DynamicParameters();
            foreach (var item in parameters)
            {
                dynamicParameters.Add(item.Key, item.Value);
            }
            return dynamicParameters;
        }
        #endregion
    }
}
