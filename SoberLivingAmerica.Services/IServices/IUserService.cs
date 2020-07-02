using SoberLivingAmerica.Entities.ResponseModel;
using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Services.IServices
{
    public interface IUserService
    {
        ResponseModel<IEnumerable<UserResponseModel>> GetAll();

        ResponseModel<int> Add(UserResponseModel model);
    }
}
