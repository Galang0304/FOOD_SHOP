import '../models/food_item.dart';

class FavoriteRepository {
  // Singleton pattern
  static final FavoriteRepository _instance = FavoriteRepository._internal();
  factory FavoriteRepository() => _instance;
  FavoriteRepository._internal();

  final List<FoodItem> _items = [];

  // Getter untuk mendapatkan semua item favorit
  List<FoodItem> get items => _items;

  // Menambah item ke favorit
  void toggleFavorite(FoodItem item) {
    final isExist = _items.contains(item);
    if (isExist) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
  }

  // Cek apakah item ada di favorit
  bool isFavorite(FoodItem item) {
    return _items.contains(item);
  }

  // Mengosongkan favorit
  void clear() {
    _items.clear();
  }
} 