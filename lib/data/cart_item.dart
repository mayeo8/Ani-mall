import 'dart:ui';

class CartItem {
  final String name;
  double price;
  final String image;
  final Color color;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    this.quantity = 1,
  });
}
