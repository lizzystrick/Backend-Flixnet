using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using FlixnetBackend.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace FlixnetBackend.Logic
{
    public class UserService : IUserService
    {
        private readonly IMapper mapper;
        private readonly IUserRepository userRepository;
        private readonly IPasswordHasher<User> passwordHasher;


        public UserService(IMapper mapper, IUserRepository userRepository, IPasswordHasher<User> passwordHasher)
        {
            this.mapper = mapper;
            this.userRepository = userRepository;
            this.passwordHasher = passwordHasher;
        }

        public async Task<string> GetUserNameById(Guid userId)
        {
            return await userRepository.GetUserNameById(userId);
        }

        public User GetUser(Guid userID)
        {
            return this.userRepository.GetUser(userID);
        }

        public User GetUserByEmail(string email)
        {
            return userRepository.GetUserByEmail(email);
            //User user = userRepository.GetUserByEmail(email);
            //return new UserModel(user);
        }

        public UserModel CreateUser(CreateUserModel insertUser)
        {
            User user = new User
            {
                UserName = insertUser.UserName,
                Email = insertUser.Email,
                Password = passwordHasher.HashPassword(null, insertUser.Password)
            };
            User returnedUser = userRepository.CreateUser(user);

            return mapper.Map<UserModel>(returnedUser);

        }

        public bool ValidateUser(LoginModel model)
        {
            User user = userRepository.GetUserByEmail(model.Email);
            if (user != null)
            {
                var result = passwordHasher.VerifyHashedPassword(user, user.Password, model.Password);
                return result == PasswordVerificationResult.Success;
            }
            return false;
        }

        /*public async Task<Guid> GetUserId(string email)
        {
            return await userRepository.GetUserId(email);
        }*/
    }
}