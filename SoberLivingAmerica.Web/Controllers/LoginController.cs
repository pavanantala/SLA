using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SoberLivingAmerica.Database.Tables;
using SoberLivingAmerica.Entities.RequestModel;
using SoberLivingAmerica.Web.Models;

namespace SoberLivingAmerica.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly SignInManager<ApplicationUser> signInManager;

        public LoginController(UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager,
            SignInManager<ApplicationUser> signInManager)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            this.signInManager = signInManager;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByNameAsync(model.UserName);
                if (user != null && await userManager.CheckPasswordAsync(user, model.Password))
                {
                    var result = await signInManager.PasswordSignInAsync(
                    model.UserName, model.Password, model.RememberMe, false);
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("", "Invalid UserName or Password");
            }
            return View("Index");
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            try
            {
                await signInManager.SignOutAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
            return View("Index");
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByNameAsync(model.UserName);

                if (user == null)
                {
                    user = new ApplicationUser
                    {
                        Id = Guid.NewGuid().ToString(),
                        UserName = model.UserName,
                        Email = model.UserName,
                        AccessFailedCount = 0,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        JobTitle = model.JobTitle,
                        //CreatedBy = ,
                        CreatedDate = DateTime.UtcNow,
                        Active =  false,
                        CompanyId = "ALT"
                    };

                    var result = await userManager.CreateAsync(user, model.Password);
                }

                return View("Success");
            }

            return View();
        }

        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
