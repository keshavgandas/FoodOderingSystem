using Microsoft.AspNetCore.Mvc;
using FoodOrderApp.Models;
using FoodOrderApp.Data;

namespace FoodOrderApp.Controllers
{
    public class FoodController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public FoodController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // ✅ Utility method to check if user is admin
        private bool IsAdmin()
        {
            return HttpContext.Session.GetString("username") == "alpha";
        }

        // ✅ Show food list (admin only)
        public IActionResult List()
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            var items = _context.FoodItems.ToList();
            return View(items);
        }

        // ✅ Add food (GET) - admin only
        public IActionResult Add()
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            return View();
        }

        // ✅ Add food (POST) - admin only
        [HttpPost]
        public IActionResult Add(FoodItem model, IFormFile ImageFile)
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            if (ImageFile != null && ImageFile.Length > 0)
            {
                string folder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                string path = Path.Combine(folder, ImageFile.FileName);
                using var stream = new FileStream(path, FileMode.Create);
                ImageFile.CopyTo(stream);

                model.ImagePath = "/images/" + ImageFile.FileName;
            }

            _context.FoodItems.Add(model);
            _context.SaveChanges();
            return RedirectToAction("List");
        }

        // ✅ Edit food (GET) - admin only
        public IActionResult Edit(int id)
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            var item = _context.FoodItems.Find(id);
            if (item == null)
                return NotFound();

            return View(item);
        }

        // ✅ Edit food (POST) - admin only
        [HttpPost]
        public IActionResult Edit(FoodItem model, IFormFile ImageFile)
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            var existingItem = _context.FoodItems.Find(model.Id);
            if (existingItem == null)
                return NotFound();

            existingItem.Name = model.Name;
            existingItem.Description = model.Description;
            existingItem.Ingredients = model.Ingredients;
            existingItem.OriginalPrice = model.OriginalPrice;
            existingItem.DiscountedPrice = model.DiscountedPrice;
            existingItem.Rating = model.Rating;
            existingItem.Stock = model.Stock;

            if (ImageFile != null && ImageFile.Length > 0)
            {
                string folder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                string path = Path.Combine(folder, ImageFile.FileName);
                using var stream = new FileStream(path, FileMode.Create);
                ImageFile.CopyTo(stream);

                existingItem.ImagePath = "/images/" + ImageFile.FileName;
            }

            _context.FoodItems.Update(existingItem);
            _context.SaveChanges();
            return RedirectToAction("List");
        }

        // ✅ Delete food - admin only
        public IActionResult Delete(int id)
        {
            if (!IsAdmin())
                return RedirectToAction("Index", "Home");

            var item = _context.FoodItems.Find(id);
            if (item == null)
                return NotFound();

            _context.FoodItems.Remove(item);
            _context.SaveChanges();
            return RedirectToAction("List");
        }
    }
}
