using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace FlixnetBackend.Logic
{
    public class UserService : IUserService
    {
        private readonly IMapper mapper;
        private readonly IUserRepository userRepository;

        public UserService(IMapper mapper, IUserRepository userRepository)
        {
            this.mapper = mapper;
            this.userRepository = userRepository;
        }

        public User GetUser(Guid userID)
        {
            return this.userRepository.GetUser(userID);
        }

        public UserModel GetUserByID(Guid userID)
        {
            User user = userRepository.GetUserByID(userID);
            return new UserModel(user);
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
    }
}
