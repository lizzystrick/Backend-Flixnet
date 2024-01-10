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
        //private readonly IMovieService movieService;
        private readonly IMapper mapper;
        private readonly ILikedMovieService likedMovieService;

        public MovieController(IMapper mapper, ILikedMovieService likedMovieService)
        {
            //this.movieService = movieLogic;
            this.mapper = mapper;
            this.likedMovieService = likedMovieService;
        }

        /*[HttpPost]
        public IActionResult SaveMovies(List<MovieModel> model)
        {
            if (model == null || model.Count == 0)
            {
                return BadRequest("Invalid movie data");
            }

            var movies = mapper.Map<List<Movie>>(model);
            movieService.SaveMovies(movies);    
            return Ok("Movies saved succesfully");
        }*/

        [HttpPost("like")]
        public async Task<IActionResult> LikeMovie([FromBody] LikeMovieModel likemoviemodel)
        {
            //await likedMovieService.LikeMovie(likemoviemodel.UserId, likemoviemodel.MovieId);
            //return Ok();
            // You might want to validate the model here
            if (likemoviemodel == null || string.IsNullOrWhiteSpace(likemoviemodel.UserId) || string.IsNullOrWhiteSpace(likemoviemodel.MovieId))
            {
                return BadRequest("Movie ID cannot be null or empty.");
            }

            // The UserID should be extracted from the authenticated user's claims
            // Assuming the user is authenticated and the UserId is in the claims
            // Convert the user ID to a Guid and call the service
            if (!Guid.TryParse(likemoviemodel.UserId, out var userId))
            {
                return BadRequest("Invalid user ID.");
            }

            // Call the service to like the movie and notify others
            await likedMovieService.LikeMovie(userId, likemoviemodel.MovieId);

            // Return a success response
            return Ok();
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetLikedMovies(Guid userId)
        {
            var likedMovies = await likedMovieService.GetLikedMoviesByUser(userId);
            if (likedMovies == null) return NotFound();
            return Ok(likedMovies);
        }


    }
}
