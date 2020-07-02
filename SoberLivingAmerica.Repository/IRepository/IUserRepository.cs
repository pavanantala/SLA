using SoberLivingAmerica.Database.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace SoberLivingAmerica.Repository.IRepository
{
    public interface IUserRepository
    {
        IList<ApplicationUser> GetUsers();

        bool IsExist(string Email, bool Active);

        int InsertUser(ApplicationUser applicationUser);
    }
}
