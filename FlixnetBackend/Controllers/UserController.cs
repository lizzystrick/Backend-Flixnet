using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using Microsoft.IdentityModel.Tokens;
using Microsoft.IdentityModel.JsonWebTokens;
using FlixnetBackend.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

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
            // Validate user credentials (example logic)
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data");

            }
            var user = userService.GetUserByEmail(model.Email);

            if (user == null || !userService.ValidateUser(model))
            {
                return Unauthorized("Invalid credentials");
            }
            
            //var token = GenerateJwtToken(model.Email, user.ID);

            // Invalid credentials
            return Ok(new { Message = "Login succesful", ID = user.ID });
        }


        /*private string GenerateJwtToken(string email, Guid ID)
        {
            var secretKey = KeyProvider.GetSecretKey();
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
            new Claim(ClaimTypes.Name, email),
            new Claim(ClaimTypes.NameIdentifier, ID.ToString())
            // Voeg eventuele andere claims toe die je nodig hebt.
        };

            var token = new JwtSecurityToken(
                configuration["Jwt:Issuer"],
                configuration["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(Convert.ToDouble(configuration["Jwt:ExpirationInMinutes"])),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }*/
    }
}
