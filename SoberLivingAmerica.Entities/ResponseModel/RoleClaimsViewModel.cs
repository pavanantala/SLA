using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Entities.ResponseModel
{
    public class RoleClaimsViewModel
    {
        public RoleClaimsViewModel()
        {
            Cliams = new List<RoleClaim>();
        }

        public string RoleId { get; set; }
        public List<RoleClaim> Cliams { get; set; }
    }
}
