using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Logic;
using FlixnetBackend.Models;
using Microsoft.AspNetCore.Identity;
using AutoMapper;
using Moq;

namespace Flixnet.Tests
{
    public class UserServiceTest
    {
        [Fact]
        public void CreateUser_ReturnsUserModel_WhenCalledWithValidData()
        {
            // Arrange
            var mockMapper = new Mock<IMapper>();
            var mockUserRepository = new Mock<IUserRepository>();
            var mockPasswordHasher = new Mock<IPasswordHasher<User>>();


            var userService = new UserService(mockMapper.Object, mockUserRepository.Object, mockPasswordHasher.Object);

            var createUserModel = new CreateUserModel
            {
                UserName = "testuser",
                Email = "test@example.com",
                Password = "password123"
            };

            var user = new User
            {
                UserName = createUserModel.UserName,
                Email = createUserModel.Email,
                Password = createUserModel.Password
            };

            mockUserRepository.Setup(repo => repo.CreateUser(It.IsAny<User>())).Returns(user);
            mockMapper.Setup(m => m.Map<UserModel>(It.IsAny<User>())).Returns(new UserModel());

            // Act
            var result = userService.CreateUser(createUserModel);

            // Assert
            Assert.NotNull(result);
            // Add more assertions as necessary
        }

        [Fact]
        public void ValidateUser_ReturnsTrue_WhenValidCredentials()
        {
            // Arrange
            var mockUserRepository = new Mock<IUserRepository>();
            var mockPasswordHasher = new Mock<IPasswordHasher<User>>();

            var userService = new UserService(null, mockUserRepository.Object, mockPasswordHasher.Object);

            var loginModel = new LoginModel
            {
                Email = "user@example.com",
                Password = "password123"
            };

            var user = new User { Password = "hashedpassword" };

            mockUserRepository.Setup(repo => repo.GetUserByEmail(It.IsAny<string>())).Returns(user);
            mockPasswordHasher.Setup(hasher => hasher.VerifyHashedPassword(user, user.Password, loginModel.Password))
                              .Returns(PasswordVerificationResult.Success);

            // Act
            var result = userService.ValidateUser(loginModel);

            // Assert
            Assert.True(result);
        }
    }
}