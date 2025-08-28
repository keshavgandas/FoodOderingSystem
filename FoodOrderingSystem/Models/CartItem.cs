using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodOrderApp.Models
{
    public class CartItem
    {
        [Key]
        public int Id { get; set; }

        public int FoodItemId { get; set; }

        [ForeignKey("FoodItemId")]
        public FoodItem FoodItem { get; set; }

        public string Username { get; set; } // Store from session

        public int Quantity { get; set; }
    }
}
