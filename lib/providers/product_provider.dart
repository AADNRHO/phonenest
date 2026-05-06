import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: "iPhone 15 Pro",
      price: 1200,
      image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      category: "Apple",
    ),
    Product(
      id: 2,
      name: "Samsung S24 Ultra",
      price: 1400,
      image: "https://images.unsplash.com/photo-1598327105666-5b89351aff97",
      category: "Samsung",
    ),
    Product(
      id: 3,
      name: "Xiaomi 14",
      price: 850,
      image: "https://images.unsplash.com/photo-1580910051074-3eb694886505",
      category: "Xiaomi",
    ),
    Product(
      id: 4,
      name: "OnePlus 12",
      price: 900,
      image: "https://images.unsplash.com/photo-1605236453806-6ff36851218e",
      category: "OnePlus",
    ),
    Product(
      id: 5,
      name: "iPhone 14 Pro",
      price: 1100,
      image: "https://images.unsplash.com/photo-1565849904461-04a58ad377e0",
      category: "Apple",
    ),
    Product(
      id: 6,
      name: "Google Pixel 8",
      price: 950,
      image: "https://images.unsplash.com/photo-1592750475338-74b7b21085ab",
      category: "Google",
    ),
  ];

  final List<Product> _cart = [];

  List<Product> get products => _products;
  List<Product> get cart => _cart;

  List<Product> get favorites => _products.where((p) => p.isFavorite).toList();

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  int get cartCount => _cart.length;
}
