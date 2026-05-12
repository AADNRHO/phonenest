import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cart = [];

  bool isOffline = false;

  List<Product> get products => _products;

  List<Product> get cart => _cart;

  List<Product> get favorites => _products.where((p) => p.isFavorite).toList();

  int get cartCount => _cart.length;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        Uri.parse(
            'https://raw.githubusercontent.com/AADNRHO/phonenest/refs/heads/main/phones.json'),
      );

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);

        _products = data.map((item) => Product.fromJson(item)).toList();

        final favoriteIds = prefs.getStringList('favorites') ?? [];

        for (var product in _products) {
          if (favoriteIds.contains(product.id.toString())) {
            product.isFavorite = true;
          }
        }

        prefs.setString(
          'cached_products',
          response.body,
        );

        isOffline = false;
      }
    } catch (e) {
      final cachedData = prefs.getString('cached_products');

      if (cachedData != null) {
        final List data = json.decode(cachedData);

        _products = data.map((item) => Product.fromJson(item)).toList();

        final favoriteIds = prefs.getStringList('favorites') ?? [];

        for (var product in _products) {
          if (favoriteIds.contains(product.id.toString())) {
            product.isFavorite = true;
          }
        }

        isOffline = true;
      }
    }

    notifyListeners();
  }

  void toggleFavorite(Product product) async {
    product.isFavorite = !product.isFavorite;

    final prefs = await SharedPreferences.getInstance();

    List<String> favoriteIds =
        favorites.map((product) => product.id.toString()).toList();

    prefs.setStringList(
      'favorites',
      favoriteIds,
    );

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
}
