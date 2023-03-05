import 'package:flutter/material.dart';
import 'package:learning_flutter/multiProvider/models/cartItem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items => _items!;

  int? get jumlah {
    return _items!.length;
  }

  void addCart(String productId, String title, int price) {
    if (items.containsKey(productId)) {
      // Sudah Tesedia Product di dalam Map
      _items?.update(
          productId,
          (value) => CartItem(
              title: value.title,
              id: value.title,
              price: value.price,
              qty: value.qty! + 1));
    } else {
      // Product baru ada di dalam Map
      _items?.putIfAbsent(
          productId,
          () => CartItem(
              title: title,
              id: DateTime.now().toString(),
              price: price,
              qty: 1));
    }
    notifyListeners();
  }
}
