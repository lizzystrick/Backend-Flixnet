using AutoMapper;
using FlixnetBackend.Interfaces;
using FlixnetBackend.Models;
using Microsoft.AspNetCore.Mvc;

namespace FlixnetBackend.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MovieController : Controller
    {
        private readonly IMovieService movieService;
        private readonly IMapper mapper;

        public MovieController(IMovieService movieLogic, IMapper mapper)
        {
            this.movieService = movieLogic;
            this.mapper = mapper;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
