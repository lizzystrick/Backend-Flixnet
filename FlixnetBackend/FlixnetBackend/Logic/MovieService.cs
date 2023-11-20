using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using FlixnetBackend.Repositories;
using System.ComponentModel.Design;

namespace FlixnetBackend.Logic
{
    public class MovieService : IMovieService
    {
        private readonly IMapper mapper;
        private readonly IMovieRepository movieRepository;

        public MovieService(IMapper mapper, IMovieRepository movieRepository)
        {
            this.mapper = mapper;
            this.movieRepository = movieRepository;
        }
    }
}
