using SoberLivingAmerica.Database.Data;
using SoberLivingAmerica.Database.IHelper;
using SoberLivingAmerica.Database.Tables;
using SoberLivingAmerica.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;

namespace SoberLivingAmerica.Repository.Repository
{
    public class UserRepository : IUserRepository
    {
        #region Properties
        private readonly IDbContext context;
        private readonly ICustomRepository<ApplicationUser> applicationUserRepository;
        private readonly IDataProvider dataProvider;
        #endregion

        #region Consturctor
        public UserRepository(IDbContext context, ICustomRepository<ApplicationUser> applicationUserRepository, IDataProvider dataProvider)
        {
            this.context = context;
            this.applicationUserRepository = applicationUserRepository;
            this.dataProvider = dataProvider;
        }
        #endregion

        #region Methods

        //public IQueryable<ApplicationUser> GetUsers()
        //{
        //    return context.Set<ApplicationUser>();
        //}

        public IList<ApplicationUser> GetUsers()
        {
            return applicationUserRepository.Table.ToList();
        }

        //public ApplicationUser GetUser(string id)
        //{
        //    return context.Set<ApplicationUser>().FirstOrDefault(x => x.Id == id);
        //}

        public bool IsExist(string Email, bool Active)
        {
            //var pCustomerId = dataProvider.GetStringParameter("Email", Email);
            //var pRole = dataProvider.GetBooleanParameter("Active", Active);
            int Result = 0;

            var pCustomerId = new SqlParameter
            {
                ParameterName = "Email",
                DbType = DbType.String,
                Value = Email
            };
            var pRole = new SqlParameter
            {
                ParameterName = "Active",
                DbType = DbType.Boolean,
                Value = Active
            };
            //var pResult = new SqlParameter
            //{
            //    ParameterName = "Result",
            //    DbType = DbType.Int32,
            //    Direction = ParameterDirection.Output
            //};

            var result = false;
            //var resultt = context.EntityFromSqlResult("UserExists", Email, Active);

            //var resultt = context.EntityFromSqlResult("UserExists",//false,null,
            //                pCustomerId, pRole,pResult);
            

            //var test = dapperWrapper.GetData<int>("UserExists", pCustomerId, pRole, pResult);
            //var test1= context.


            var resultt = context.EntityFromSqlResult("UserExists", pCustomerId, pRole);//false,null,
                            //Email, Active);

            //using (var contexts = new ApplicationDbContext())
            //{
            //    var blogNames = contexts.Database.SqlQuery<string>(
            //                       "SELECT Name FROM dbo.Blogs").ToList();
            //}

            return result;
        }

        //public bool IsExist(Expression<Func<ApplicationUser, bool>> predicate)
        //{
        //    return GetUser().Any(predicate);
        //}

        //public IQueryable<ApplicationUser> GetUser()
        //{
        //    return context.Set<ApplicationUser>();
        //}

        public int InsertUser(ApplicationUser applicationUser)
        {
            if (applicationUser == null)
                throw new ArgumentNullException(nameof(applicationUser));

            applicationUser.CreatedBy = "asdfdsda";

            var paramFirstName = new SqlParameter
            {
                ParameterName = "FirstName",
                DbType = DbType.String,
                Value = applicationUser.FirstName
            };
            var paramLastName = new SqlParameter
            {
                ParameterName = "LastName",
                DbType = DbType.String,
                Value = applicationUser.LastName
            };
            var paramUserName = new SqlParameter
            {
                ParameterName = "UserName",
                DbType = DbType.String,
                Value = applicationUser.Email
            };
            var paramEmail = new SqlParameter
            {
                ParameterName = "Email",
                DbType = DbType.String,
                Value = applicationUser.Email
            };
            var paramActive = new SqlParameter
            {
                ParameterName = "Active",
                DbType = DbType.Boolean,
                Value = applicationUser.Active
            };
            var paramCreatedBy = new SqlParameter
            {
                ParameterName = "CreatedBy",
                DbType = DbType.String,
                Value = applicationUser.CreatedBy
            };

            var paramJobTitle = new SqlParameter
            {
                ParameterName = "JobTitle",
                DbType = DbType.String,
                Value = applicationUser.JobTitle
            };
            var paramCompanyId = new SqlParameter
            {
                ParameterName = "CompanyId",
                DbType = DbType.String,
                Value = "ALT"//applicationUser.CompanyId
            };

            var paramAccessFailedCount = new SqlParameter
            {
                ParameterName = "AccessFailedCount",
                DbType = DbType.Int32,
                Value = applicationUser.AccessFailedCount
            };


            var result = context.ExecuteSqlCommand("InsertUser", false, null, paramFirstName, paramLastName,
                paramUserName, paramEmail, paramActive, paramCreatedBy,
                paramJobTitle, paramCompanyId, paramAccessFailedCount);

            //var result = context.ExecuteSqlCommand("InsertUser",false, null, applicationUser.FirstName, applicationUser.LastName,
            //    applicationUser.UserName, applicationUser.Email, applicationUser.Active, applicationUser.CreatedBy,
            //    applicationUser.JobTitle, applicationUser.CompanyId, applicationUser.AccessFailedCount);

            //context.Set<ApplicationUser>().Add(applicationUser);
            //return context.SaveChanges();
            return result;
        }
        //public ApplicationUser Create()
        //{

        //}

        #endregion

    }
}
