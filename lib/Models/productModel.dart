class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final double? rating;
  final int? ratingCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    this.rating,
    this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rate'] as num?)?.toDouble(),
      ratingCount: (json['count'] as num?)?.toInt(),
    );
  }
}
