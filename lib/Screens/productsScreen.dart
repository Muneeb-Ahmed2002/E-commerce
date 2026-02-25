import 'package:e_commerce_mini_app/Core/constants.dart';
import 'package:e_commerce_mini_app/Providers/productProvider.dart';
import 'package:e_commerce_mini_app/Screens/productDetailsScreen.dart';
import 'package:e_commerce_mini_app/Widgets/Retry.dart';
import 'package:e_commerce_mini_app/Widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDisplay extends StatefulWidget {
  const ProductsDisplay({super.key});

  @override
  State<ProductsDisplay> createState() => _ProductsDisplayState();
}

class _ProductsDisplayState extends State<ProductsDisplay> {
  final ScrollController _scrollController = ScrollController();
  bool _showFAB = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProductProvider>().fetchProducts());
    _scrollController.addListener(() {
      if (_scrollController.offset > 150 && !_showFAB) {
        setState(() {
          _showFAB = true;
        });
      } else if (_scrollController.offset <= 150 && _showFAB) {
        setState(() {
          _showFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        backgroundColor: buttonColor,
      ),
      body: Consumer<ProductProvider>(builder: (context, products, child) {
        if (products.isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Loading'),
              ],
            ),
          );
        }
        if (products.errorMessage != null) {
          return Retry(
            icon: const Icon(Icons.sentiment_dissatisfied_outlined),
            message: 'An Unexpected error occurred',
            onRetry: () => context.read<ProductProvider>().fetchProducts(),
          );
        }
        if (products.products.isEmpty) {
          return Retry(
            icon: const Icon(Icons.sentiment_satisfied_outlined),
            message: 'No Products Available',
            onRetry: () => context.read<ProductProvider>().fetchProducts(),
          );
        }
        return RefreshIndicator(
          onRefresh: products.refreshProducts,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: products.products.length,
              itemBuilder: (context, index) {
                final product = products.products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                );
              }),
        );
      }),
      floatingActionButton: _showFAB
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: buttonColor,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
