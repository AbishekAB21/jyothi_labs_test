import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/models/product_model.dart';

class DetailScreenProvider with ChangeNotifier {
  final List<Product> _products;

  DetailScreenProvider(this._products);

  void increaseQuantity(int productId) {
    final product = _products.firstWhere((prod) => prod.id == productId);
    if (product.quantity < product.stock) {
      product.quantity++;
      product.totalPrice+= product.price;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final product = _products.firstWhere((prod) => prod.id == productId);
    if (product.quantity > 1) {
      product.quantity--;
      product.totalPrice -= product.price;
      notifyListeners();
    }
  }

  List<Product> get products => _products;
}
