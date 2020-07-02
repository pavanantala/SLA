using Microsoft.AspNetCore.Mvc;
using SoberLivingAmerica.Entities.ResponseModel;
using SoberLivingAmerica.Services.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoberLivingAmerica.Web.Controllers
{
    public class UserController : Controller
    {
        private readonly IUserService userService;

        public UserController(IUserService userService)
        {
            this.userService = userService;
        }

        public IActionResult Index()
        {
            var response = userService.GetAll();
            return View(response.Result);
        }

        [HttpGet]
        public IActionResult AddUser()
        {
            //if (ModelState.IsValid)
            //{
            //    var response = userService.Add(model);
            //}
            return View();
        }

        [HttpPost]
        public IActionResult AddUser(UserResponseModel model)
        {
            if (ModelState.IsValid)
            {
                var response = userService.Add(model);
            }
            return View();
        }
    }
}
