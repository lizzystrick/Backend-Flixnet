using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
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
        private readonly UserManager<User> usermanager;
        private readonly SignInManager<User> signInManager;

        public UserService(IMapper mapper, IUserRepository userRepository, IPasswordHasher<User> passwordHasher, UserManager<User> usermanager, SignInManager<User> signInManager)
        {
            this.mapper = mapper;
            this.userRepository = userRepository;
            this.passwordHasher = passwordHasher;
            this.usermanager = usermanager;
            this.signInManager = signInManager;
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
            User user = new User();
            user.UserName = insertUser.UserName;
            user.Email = insertUser.Email;
            user.Password = insertUser.Password;
            User returnedUser = userRepository.CreateUser(user);

            return new UserModel(returnedUser);

        }

        public async Task<bool> ValidateUser(LoginModel model)
        {
            var user = await usermanager.FindByIdAsync(model.ID.ToString());

            if (user != null)
            {
                var signInResult = await signInManager.CheckPasswordSignInAsync(user, model.Password, false);
                return signInResult.Succeeded;

            }

            return false;
        }

        /*public async Task<Guid> GetUserId(string email)
        {
            return await userRepository.GetUserId(email);
        }*/
    }
}