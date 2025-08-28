using FoodOrderApp.Data;
using FoodOrderApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FoodOrderApp.Controllers
{
    public class CartController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CartController(AppDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        private string GetUsername()
        {
            return _httpContextAccessor.HttpContext.Session.GetString("username");
        }

        [HttpPost]
        public async Task<IActionResult> AddToCart()
        {
            var username = GetUsername();
            if (string.IsNullOrEmpty(username))
                return Json(new { success = false, message = "⚠️ You are not logged in." });

            using var reader = new StreamReader(Request.Body);
            var body = await reader.ReadToEndAsync();

            var request = System.Text.Json.JsonSerializer.Deserialize<CartRequest>(
                body,
                new System.Text.Json.JsonSerializerOptions { PropertyNameCaseInsensitive = true }
            );

            if (request == null || request.FoodItemId <= 0)
                return Json(new { success = false, message = "❌ Invalid item request." });

            var foodItem = _context.FoodItems.FirstOrDefault(f => f.Id == request.FoodItemId);
            if (foodItem == null)
                return Json(new { success = false, message = "❌ Food item not found." });

            var existingItem = _context.CartItems.FirstOrDefault(c => c.FoodItemId == request.FoodItemId && c.Username == username);
            if (existingItem != null)
            {
                existingItem.Quantity++;
            }
            else
            {
                var cartItem = new CartItem
                {
                    FoodItemId = request.FoodItemId,
                    Quantity = 1,
                    Username = username
                };
                _context.CartItems.Add(cartItem);
            }

            _context.SaveChanges();
            Console.WriteLine("Raw Body: " + body);
            Console.WriteLine("Deserialized FoodItemId: " + request?.FoodItemId);
            return Json(new { success = true, message = "Item added to cart." });
        }

        [HttpGet]
        public IActionResult ViewCart()
        {
            var username = GetUsername();
            var cartItems = _context.CartItems
                .Include(ci => ci.FoodItem)
                .Where(ci => ci.Username == username)
                .ToList();
            return PartialView("~/Views/Home/Cart.cshtml", cartItems);
        }

        [HttpPost]
        public IActionResult UpdateQuantity(int id, int quantity)
        {
            var username = GetUsername();
            var item = _context.CartItems.FirstOrDefault(c => c.Id == id && c.Username == username);

            if (item == null)
                return NotFound(); // Safeguard against missing or foreign access

            if (quantity <= 0)
            {
                _context.CartItems.Remove(item); // Auto-delete when quantity is 0 or negative
            }
            else
            {
                item.Quantity = quantity;
            }

            _context.SaveChanges();
            return Ok();
        }

        [HttpPost]
        public IActionResult RemoveItem(int id)
        {
            var username = GetUsername();
            var item = _context.CartItems.FirstOrDefault(c => c.Id == id && c.Username == username);

            if (item != null)
            {
                _context.CartItems.Remove(item);
                _context.SaveChanges();
            }

            return Ok();
        }

        public class CartRequest
        {
            public int FoodItemId { get; set; }
        }
    }
}
