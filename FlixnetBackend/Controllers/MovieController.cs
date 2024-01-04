using AutoMapper;
using FlixnetBackend.Business;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Logic;
using FlixnetBackend.Models;
using FlixnetBackend.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace FlixnetBackend.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieService movieService;
        private readonly IMapper mapper;
        private readonly ILikedMovieService likedMovieService;

        public MovieController(IMovieService movieLogic, IMapper mapper, ILikedMovieService likedMovieService)
        {
            this.movieService = movieLogic;
            this.mapper = mapper;
            this.likedMovieService = likedMovieService;
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
        [HttpPost("like")]
        public async Task<IActionResult> LikeMovie([FromBody] LikeMovieModel request)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            await likedMovieService.LikeMovie(new Guid(userId), request.MovieId);
            return Ok();
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetLikedMovies(Guid userId)
        {
            var likedMovies = await likedMovieService.GetLikedMoviesByUser(userId);
            return Ok(likedMovies);
        }


    }
}
