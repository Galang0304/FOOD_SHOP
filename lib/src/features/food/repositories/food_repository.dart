import '../models/food_item.dart';

class FoodRepository {
  // Singleton pattern
  static final FoodRepository _instance = FoodRepository._internal();
  factory FoodRepository() => _instance;
  FoodRepository._internal();

  // Data dummy untuk makanan
  final List<FoodItem> _foodItems = [
    const FoodItem(
      name: 'Nasi Goreng Spesial',
      description: 'Nasi goreng dengan telur, ayam, dan sayuran',
      price: 25000,
      imageUrl: 'assets/images/nasi_goreng.jpg',
      rating: 4.5,
    ),
    const FoodItem(
      name: 'Mie Goreng',
      description: 'Mie goreng dengan bakso dan sayuran',
      price: 22000,
      imageUrl: 'assets/images/mie_goreng.jpg',
      rating: 4.3,
    ),
    const FoodItem(
      name: 'Sate Ayam',
      description: 'Sate ayam dengan bumbu kacang',
      price: 30000,
      imageUrl: 'assets/images/sate_ayam.jpg',
      rating: 4.7,
    ),
    const FoodItem(
      name: 'Gado-gado',
      description: 'Sayuran segar dengan bumbu kacang',
      price: 20000,
      imageUrl: 'assets/images/gado_gado.jpg',
      rating: 4.4,
    ),
    const FoodItem(
      name: 'Sop Ayam',
      description: 'Sop ayam dengan sayuran segar',
      price: 15000,
      imageUrl: 'assets/images/sop_ayam.jpg',
      rating: 4.2,
    ),
    const FoodItem(
      name: 'Nasi Kuning',
      description: 'Nasi kuning dengan ayam, telur, dan sayuran',
      price: 18000,
      imageUrl: 'assets/images/nasi_kuning.jpg',
      rating: 4.6,
    ),
    const FoodItem(
      name: 'Minuman Kopi',
      description: 'Minuman dingin dengan susu dan kopi',
      price: 10000,
      imageUrl: 'assets/images/minuman_kopi.jpg',
      rating: 4.8,
    ),
  ];

  // Getter untuk mendapatkan semua makanan
  List<FoodItem> getAllFoodItems() {
    print('DEBUG: Mengambil semua item makanan');
    print('DEBUG: Jumlah item: ${_foodItems.length}');
    return _foodItems;
  }

  // Method untuk mencari makanan berdasarkan nama
  List<FoodItem> searchFoodItems(String query) {
    print('DEBUG: Mencari makanan dengan query: $query');
    final results = _foodItems.where((item) =>
      item.name.toLowerCase().contains(query.toLowerCase()) ||
      item.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
    print('DEBUG: Hasil pencarian: ${results.length} item');
    return results;
  }

  // Method untuk mendapatkan makanan berdasarkan rating minimal
  List<FoodItem> getFoodItemsByMinRating(double minRating) {
    return _foodItems.where((item) => item.rating >= minRating).toList();
  }

  // Method untuk mendapatkan makanan berdasarkan rentang harga
  List<FoodItem> getFoodItemsByPriceRange(double minPrice, double maxPrice) {
    return _foodItems.where((item) =>
      item.price >= minPrice && item.price <= maxPrice
    ).toList();
  }
} 