# 🍽️ Food Ordering System – ASP.NET Core MVC

Welcome to the **Food Ordering System** repository! This is a complete online food ordering web application developed using **ASP.NET Core MVC** and **MySQL**, designed for seamless browsing, cart management, and admin-based food item management. 💻📦

---

## 🌟 Key Features

### 🍕 Customer Side

* **Explore Food Menu**: View a dynamic grid of food items with images, ingredients, ratings, price, and availability.
* **Add to Cart**: Add any food item to your cart with a single click.
* **Update Cart**: Change quantity, remove items, or clear the cart — all from a slick modal.
* **Live Toast Notifications**: Instant feedback for cart actions.

### 🛠️ Admin Side

* **Admin Authentication**: Only user with username `alpha` can access the admin panel.
* **Add Food**: Upload new food items with image, price, stock, ingredients.
* **Edit Food**: Modify any existing food item.
* **Delete Food**: Remove items from the menu.

---

## 🧰 Tech Stack

| Layer    | Technologies                    |
| -------- | ------------------------------- |
| Frontend | HTML5, CSS3, Bootstrap 5, Razor |
| Backend  | ASP.NET Core MVC (.NET 9 SDK)   |
| Database | MySQL                           |
| ORM      | Entity Framework Core + Pomelo  |
| Tools    | Visual Studio 2022/2025, NuGet  |

---

## 🚀 Getting Started

### ✅ Prerequisites

* [.NET 9 SDK](https://dotnet.microsoft.com/en-us/download)
* [MySQL Server](https://dev.mysql.com/downloads/)
* Visual Studio or VS Code
* Git (for cloning repo)

---

## 🛠️ Setup Guide

### 1. Clone the Repository

```bash
git clone https://github.com/rathi-java/FoodOrderingSystem-ASP.NET-Core.git
cd FoodOrderingSystem-ASP.NET-Core
```

### 2. Configure MySQL

Open `appsettings.json` and update your DB credentials:

```json
"ConnectionStrings": {
  "DefaultConnection": "server=localhost;port=3306;database=foodorderdb;user=root;password=db_password"
}
```

### 3. Install Dependencies (NuGet Packages)

```powershell
Install-Package Microsoft.EntityFrameworkCore
Install-Package Microsoft.EntityFrameworkCore.Design
Install-Package Microsoft.EntityFrameworkCore.Tools
Install-Package Pomelo.EntityFrameworkCore.MySql
```

### 4. Run Migrations

```powershell
Add-Migration InitialCreate
Update-Database
```

### 5. Run the Application

```bash
dotnet run
```

Visit: `http://localhost:<port>/`

---

## 📦 Usage Guide

* **Home Page** (`/`): Welcome screen with animated CTA.
* **Cart Modal**: Floating cart button lets you view, update, or clear cart on the same page.
* **Admin Panel**:

  * `/Food/List` → View All Items
  * `/Food/Add` → Add New Food
  * `/Food/Edit/{id}` → Edit Item
  * `/Food/Delete/{id}` → Delete Item

**⚠️ Note:** Only session user `alpha` can access admin pages.

---

## ✅ Completed Functionalities

* [x] Public menu listing with food cards
* [x] Live cart modal with update/delete
* [x] Session-based cart support
* [x] Admin-only food item management
* [x] Stock display and restriction
* [x] Fully integrated with MySQL
* [x] Bootstrap 5 UI/UX

---

## 🧠 Future Enhancements

* Login / Register System
* Online Payment Gateway
* Order History + Checkout flow
* User Roles (Admin/Customer)
* Hosting on Render / Azure / Hostinger

---

## 👨‍💻 Author

* **Name:** Keshav Gandas
* **Email:** keshavgandas1@gmail.com
* **GitHub:** [keshavgandas](https://github.com/keshavgandas)


---

## 📄 License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute.

---

## 🙋‍♂️ Feedback?

Raise an issue or connect via GitHub. Let's build better, together. 🚀
