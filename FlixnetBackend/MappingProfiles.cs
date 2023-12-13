using AutoMapper;
using FlixnetBackend.Models;

namespace FlixnetBackend
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<Business.Movie, Models.MovieModel>();
            CreateMap<Models.MovieModel, Business.Movie>();
            CreateMap<Business.User, Models.UserModel>();
            CreateMap<Models.UserModel, Business.User>();
        }

    }
}
