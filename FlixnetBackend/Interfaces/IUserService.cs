﻿using FlixnetBackend.Business;
using FlixnetBackend.Models;

namespace FlixnetBackend.Interfaces
{
    public interface IUserService
    {
        User GetUserByEmail(string email);
        UserModel CreateUser(CreateUserModel user);
        bool ValidateUser(LoginModel model);
        //Task<Guid> GetUserId(string email);

    }
}
