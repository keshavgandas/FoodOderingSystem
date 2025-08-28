using System.ComponentModel.DataAnnotations;

namespace FoodOrderApp.Models
{
    public class FoodItem
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        public string Description { get; set; }

        public string Ingredients { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Stock must be a non-negative number.")]
        public int Stock { get; set; }

        public decimal OriginalPrice { get; set; }

        public decimal DiscountedPrice { get; set; }

        public int Rating { get; set; } // Range from 1 to 5

        public string ImagePath { get; set; } // this will store path like "/images/abc.jpg"
    }
}
