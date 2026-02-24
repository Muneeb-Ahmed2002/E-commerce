import 'dart:convert';

import 'package:e_commerce_mini_app/Models/productModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ProductModel>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
