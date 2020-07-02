using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SoberLivingAmerica.Entities.RequestModel
{
    public class RegisterModel
    {
        [DataType(DataType.EmailAddress)]
        public string UserName { get; set; }

        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Compare("Password")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string JobTitle { get; set; }
        public string CompanyId { get; set; }
        //public bool Active { get; set; }
        //public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
