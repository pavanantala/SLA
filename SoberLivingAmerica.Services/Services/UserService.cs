using AutoMapper;
using SoberLivingAmerica.Database.Tables;
using SoberLivingAmerica.Entities.ResponseModel;
using SoberLivingAmerica.Repository.IRepository;
using SoberLivingAmerica.Services.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace SoberLivingAmerica.Services.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository userRepository;
        private readonly IMapper mapper;

        public UserService(IUserRepository userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }

        public ResponseModel<IEnumerable<UserResponseModel>> GetAll()
        {
            ResponseModel<IEnumerable<UserResponseModel>> response = new ResponseModel<IEnumerable<UserResponseModel>>();
            try
            {
                IEnumerable<ApplicationUser> applicationUser = userRepository.GetUsers();
                response.HasError = false;
                response.Message = Helpers.ResponseMessage.GetResult;
                response.Result = mapper.Map<List<ApplicationUser>, List<UserResponseModel>>(applicationUser.ToList());
                response.StatusCode = HttpStatusCode.OK;
                return response;
            }
            catch (Exception ex)
            {
                response.HasError = true;
                response.Message = ex.Message;
                response.StatusCode = HttpStatusCode.InternalServerError;
                return response;
            }
        }

        public ResponseModel<int> Add(UserResponseModel model)
        {
            ResponseModel<int> response = new ResponseModel<int>();
            try
            {
                // Check subscription exist with same name.
                bool isExist = userRepository.IsExist(model.Email, model.Active);
                if (isExist)
                {
                    response.HasError = true;
                    response.Message = string.Format(Helpers.ResponseMessage.SubscriptionAlreadyExist, model.Email);
                    response.StatusCode = HttpStatusCode.BadRequest;
                    return response;
                }

                var applicationUser = mapper.Map<ApplicationUser>(model);
                int result = userRepository.InsertUser(applicationUser);
                model.Id = applicationUser.Id;

                response.HasError = false;
                response.Message = Helpers.ResponseMessage.SubscriptionAdded;
                response.StatusCode = HttpStatusCode.OK;
                return response;
            }
            catch (Exception ex)
            {
                response.HasError = true;
                response.Message = ex.Message;
                response.StatusCode = HttpStatusCode.InternalServerError;
                return response;
            }
        }

    }
}
