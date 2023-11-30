using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;

namespace FlixnetBackend.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUserService userService;
        private readonly IMapper mapper;

        public UserController(IUserService userService, IMapper mapper)
        {
            this.userService = userService;
            this.mapper = mapper;
        }

        [HttpGet]
        [Route("{ID}")]
        public IActionResult GetUserByID(Guid ID)
        {
            return Ok(userService.GetUserByID(ID));
        }

        [HttpPost]
        public IActionResult CreateUser(CreateUserModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            UserModel result = userService.CreateUser(model);

            return Ok(result);
        }
    }
}
