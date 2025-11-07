import 'package:flutter/foundation.dart';
import '../model/cart_item.dart';
import '../model/product.dart';

class CartStore extends ChangeNotifier {
  CartStore._();
  static final CartStore instance = CartStore._();

  final List<CartItem> _items = <CartItem>[];

  List<CartItem> get items => List<CartItem>.unmodifiable(_items);

  int get totalMinutes =>
      _items.fold(0, (sum, e) => sum + e.product.minutes * e.quantity);

  int quantityOf(String productId) {
    final idx = _items.indexWhere((e) => e.product.id == productId);
    if (idx < 0) return 0;
    return _items[idx].quantity;
  }

  void add(Product product) {
    final idx = _items.indexWhere((e) => e.product.id == product.id);
    if (idx >= 0) {
      _items[idx].quantity += 1;
    } else {
      _items.insert(0, CartItem(product: product));
    }
    notifyListeners();
  }

  void increment(Product product) => add(product);

  void decrement(Product product) {
    final idx = _items.indexWhere((e) => e.product.id == product.id);
    if (idx < 0) return;
    final newQuantity = _items[idx].quantity - 1;
    if (newQuantity <= 0) {
      removeAt(idx);
      return;
    }
    _items[idx].quantity = newQuantity;
    notifyListeners();
  }

  /// Decrease quantity but keep the item even if it reaches 0 (used in cart page)
  void decrementKeep(Product product) {
    final idx = _items.indexWhere((e) => e.product.id == product.id);
    if (idx < 0) return;
    _items[idx].quantity = (_items[idx].quantity - 1).clamp(0, 1 << 31);
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void removeZeros() {
    _items.removeWhere((e) => e.quantity <= 0);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
