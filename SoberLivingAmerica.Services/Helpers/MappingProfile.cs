using AutoMapper;
using SoberLivingAmerica.Database.Tables;
using SoberLivingAmerica.Entities.RequestModel;
using SoberLivingAmerica.Entities.ResponseModel;

namespace SoberLivingAmerica.Services.Helpers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<UserResponseModel, ApplicationUser>().ReverseMap();          
        }
    }
}
