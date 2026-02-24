import 'package:e_commerce_mini_app/Models/productModel.dart';
import 'package:flutter/material.dart';

import '../Core/constants.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: buttonColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: grey,
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    color: grey,
                    child: const Center(child: Icon(Icons.image)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Category
            Text(
              'Category: ${product.category}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Add to Cart functionality using CartProvider
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
