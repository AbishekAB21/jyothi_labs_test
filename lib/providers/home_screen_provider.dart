import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price; 
  int quantity;
  final int stock;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.quantity,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'], // Convert to double
      quantity: 1,
      stock: json['stock'],
    );
  }
}

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://dummyjson.com/products');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final List<dynamic> productsJson = responseData['products'];

        print('Fetched Products: $productsJson');

        _products = productsJson.map((json) => Product.fromJson(json)).toList();
        print('Parsed Products: $_products'); 
      } else {
        print('Failed to fetch products. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }

    _isLoading = false;
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final product = _products.firstWhere((prod) => prod.id == productId);
    if (product.quantity < product.stock) {
      product.quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final product = _products.firstWhere((prod) => prod.id == productId);
    if (product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }
}
