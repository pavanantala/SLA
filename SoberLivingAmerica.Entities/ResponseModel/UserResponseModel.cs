using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Entities.ResponseModel
{
    public class UserResponseModel
    {
        public UserResponseModel()
        {
            Roles = new List<string>();
        }

        public string Id { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string JobTitle { get; set; }
        public string CompanyId { get; set; }
        public bool Active { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public DateTime? ActivatedDate { get; set; }
        public DateTime? DeactivatedDate { get; set; }

        public IList<string> Roles { get; set; }
    }
}
