import '../models/cart_item.dart';
import '../models/food_item.dart';

class CartRepository {
  // Singleton pattern
  static final CartRepository _instance = CartRepository._internal();
  factory CartRepository() => _instance;
  CartRepository._internal();

  final List<CartItem> _items = [];

  // Getter untuk mendapatkan semua item di keranjang
  List<CartItem> get items => _items;

  // Getter untuk total harga
  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  // Menambah item ke keranjang
  void addItem(FoodItem item) {
    final existingIndex = _items.indexWhere((cartItem) => cartItem.item == item);
    if (existingIndex != -1) {
      // Update quantity jika item sudah ada
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      // Tambah item baru jika belum ada
      _items.add(CartItem(item: item));
    }
  }

  // Mengurangi quantity item di keranjang
  void decreaseItem(FoodItem item) {
    final existingIndex = _items.indexWhere((cartItem) => cartItem.item == item);
    if (existingIndex != -1) {
      if (_items[existingIndex].quantity > 1) {
        // Kurangi quantity jika lebih dari 1
        _items[existingIndex] = _items[existingIndex].copyWith(
          quantity: _items[existingIndex].quantity - 1,
        );
      } else {
        // Hapus item jika quantity 1
        _items.removeAt(existingIndex);
      }
    }
  }

  // Menghapus item dari keranjang
  void removeItem(FoodItem item) {
    _items.removeWhere((cartItem) => cartItem.item == item);
  }

  // Mengosongkan keranjang
  void clear() {
    _items.clear();
  }
} 