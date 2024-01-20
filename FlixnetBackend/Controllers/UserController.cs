using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using Microsoft.IdentityModel.Tokens;
using Microsoft.IdentityModel.JsonWebTokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using FlixnetBackend.Logic;

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

        [HttpGet("{userId}")]
        public async Task<ActionResult<string>> GetUserName(Guid userId)
        {
            var userName = await userService.GetUserNameById(userId);
            if (string.IsNullOrEmpty(userName))
            {
                return NotFound("User not found.");
            }
            return Ok(userName);
        }

        [HttpPut("{userId}")]
        public async Task<IActionResult> UpdateUser(Guid userId, [FromBody] UpdateUserModel model)
        {
            if (userId != model.ID)
            {
                return BadRequest("Mismatched user ID.");
            }

            try
            {
                await userService.UpdateUserAsync(model);
                return NoContent();
            }
            catch (KeyNotFoundException)
            {
                return NotFound();
            }

        }

        [HttpGet]
        [Route("{ID}")]
        public IActionResult GetUserByEmail(string email)
        {
            return Ok(userService.GetUserByEmail(email));
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

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data");

            }
            var user = userService.GetUserByEmail(model.Email);

            if (user == null || !userService.ValidateUser(model))
            {
                return Unauthorized("Invalid credentials");
            }
            


            return Ok(new { Message = "Login succesful", ID = user.ID });
        }

    }
}
