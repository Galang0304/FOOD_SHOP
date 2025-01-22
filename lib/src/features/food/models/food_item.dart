class FoodItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;

  const FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  // Factory constructor untuk membuat FoodItem dari JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  // Method untuk mengkonversi FoodItem ke JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  // Method untuk membuat salinan FoodItem dengan nilai yang diperbarui
  FoodItem copyWith({
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    double? rating,
  }) {
    return FoodItem(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
    );
  }
} 