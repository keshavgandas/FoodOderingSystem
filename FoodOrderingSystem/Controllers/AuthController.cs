using FoodOrderApp.Data;
using FoodOrderApp.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace FoodOrderApp.Controllers
{
    public class AuthController : Controller
    {
        private readonly AppDbContext _context;

        public AuthController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public IActionResult Register([FromBody] User user)
        {
            if (!ModelState.IsValid)
                return BadRequest("Invalid data");

            if (_context.Users.Any(u => u.Username == user.Username || u.Email == user.Email))
                return Conflict("Username or Email already exists");

            _context.Users.Add(user);
            _context.SaveChanges();

            return Ok("User registered successfully");
        }

        [HttpPost]
        public IActionResult Login([FromBody] LoginDto login)
        {
            if (!ModelState.IsValid)
                return BadRequest("Invalid data");

            // Try matching username or email
            var user = _context.Users
                .FirstOrDefault(u => (u.Username == login.UserInput || u.Email == login.UserInput) && u.Password == login.Password);

            if (user == null)
                return Unauthorized("Invalid credentials");

            HttpContext.Session.SetString("username", user.Username);
            HttpContext.Session.SetString("userEmail", user.Email);

            return Ok("Login successful!");
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

    }
}
