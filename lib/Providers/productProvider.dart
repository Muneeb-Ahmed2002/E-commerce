import 'package:e_commerce_mini_app/Models/productModel.dart';
import 'package:e_commerce_mini_app/Services/apiService.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await ApiService.fetchProducts();

      if (_products.isEmpty) {
        _errorMessage = "No products found";
      }
    } catch (e) {
      _errorMessage = e.toString();
      _products = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
  }
}
