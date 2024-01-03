using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Controllers;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using Microsoft.AspNetCore.Mvc;
using Moq;

namespace Flixnet.Tests
{
    public class UserControllerTest
    {
        [Fact]
        public void GetUserByEmail_ReturnsOk_WhenUserExists()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            var mockMapper = new Mock<IMapper>();
            mockUserService.Setup(s => s.GetUserByEmail("test@example.com")).Returns(new User());

            var controller = new UserController(mockUserService.Object, mockMapper.Object);

            // Act
            var result = controller.GetUserByEmail("test@example.com");

            // Assert
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task Login_ReturnsUnauthorized_WhenInvalidCredentials()
        {
            // Arrange
            var mockUserService = new Mock<IUserService>();
            var mockMapper = new Mock<IMapper>();
            mockUserService.Setup(s => s.GetUserByEmail(It.IsAny<string>())).Returns(new User());

            var controller = new UserController(mockUserService.Object, mockMapper.Object);

            // Act
            var result = await controller.Login(new LoginModel { Email = "user@example.com", Password = "wrongpass" });

            // Assert
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task Login_ReturnsOk_WhenValidCredentials()
        {
            // Arrange
            var user = new User { ID = Guid.NewGuid() };
            var mockUserService = new Mock<IUserService>();
            mockUserService.Setup(s => s.GetUserByEmail(It.IsAny<string>())).Returns(user);
            mockUserService.Setup(s => s.ValidateUser(It.IsAny<LoginModel>())).Returns(true);

            var controller = new UserController(mockUserService.Object, new Mock<IMapper>().Object);

            // Act
            var result = controller.Login(new LoginModel { Email = "user@example.com", Password = "correctpass" });

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result);
            Assert.NotNull(okResult.Value);
            // Additional assertions to check the response content
        }
    }
}
