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

        private readonly IMapper mapper;
        private readonly ILikedMovieService likedMovieService;

        public MovieController(IMapper mapper, ILikedMovieService likedMovieService)
        {

            this.mapper = mapper;
            this.likedMovieService = likedMovieService;
        }

        [HttpDelete("{userId}/likes/{movieId}")]
        public async Task<IActionResult> DeleteLikedMovie(Guid userId, string movieId)
        {
            try
            {
                bool deleted = await likedMovieService.DeleteLikedMovieAsync(userId, movieId);
                if (deleted)
                {
                    return NoContent();
                }
                else
                {
                    return NotFound("Movie or user not found.");
                }
            }
            catch (Exception ex)
            {
                
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost("like")]
        public async Task<IActionResult> LikeMovie([FromBody] LikeMovieModel likemoviemodel)
        {

            if (likemoviemodel == null || string.IsNullOrWhiteSpace(likemoviemodel.UserId) || string.IsNullOrWhiteSpace(likemoviemodel.MovieId))
            {
                return BadRequest("Movie ID cannot be null or empty.");
            }

            if (!Guid.TryParse(likemoviemodel.UserId, out var userId))
            {
                return BadRequest("Invalid user ID.");
            }

            await likedMovieService.LikeMovie(userId, likemoviemodel.MovieId);

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
