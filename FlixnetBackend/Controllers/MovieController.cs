using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using FlixnetBackend.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FlixnetBackend.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieService movieService;
        private readonly IMapper mapper;

        public MovieController(IMovieService movieLogic, IMapper mapper)
        {
            this.movieService = movieLogic;
            this.mapper = mapper;
         
        }

        [HttpPost]
        public IActionResult SaveMovies(List<MovieModel> model)
        {
            if (model == null || model.Count == 0)
            {
                return BadRequest("Invalid movie data");
            }

            var movies = mapper.Map<List<Movie>>(model);
            movieService.SaveMovies(movies);    
            return Ok("Movies saved succesfully");
        }
    }
}
