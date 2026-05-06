# PhoneNest 📱

## Project Overview
PhoneNest is a modern Flutter-based mobile phone store application developed as part of the Flutter course assignment.

The application provides an interactive shopping experience for users to browse smartphones, view product details, add products to favorites, manage their shopping cart, and complete checkout.

---

## Features

### Home Page
- Displays a collection of mobile phones
- Attractive product cards
- Product images, names, and prices

### Favorite Page
- Add/remove products from favorites
- Real-time updates

### Cart Page
- Add products to cart
- Remove products from cart
- Checkout button with confirmation SnackBar

### Product Details Page
- Product image
- Product name
- Price
- Category
- Add to cart
- Add to favorites

### State Management
This project uses **Provider** for state management to ensure:
- Real-time cart updates
- Favorite synchronization
- Dynamic cart badge count

---

## Technologies Used
- Flutter
- Dart
- Provider

---

## Application Structure

```plaintext
lib/
├── models/
├── providers/
├── screens/
└── main.dart