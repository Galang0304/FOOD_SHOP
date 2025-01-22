import 'food_item.dart';

class CartItem {
  final FoodItem item;
  final int quantity;

  const CartItem({
    required this.item,
    this.quantity = 1,
  });

  double get totalPrice => item.price * quantity;

  CartItem copyWith({
    FoodItem? item,
    int? quantity,
  }) {
    return CartItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
} 