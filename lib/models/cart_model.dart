import 'package:flutter/material.dart';

// Definimos cómo es un producto en el carrito
class CartItem {
  final String name;
  final String price;
  final String imagePath;
  final dynamic color;
  final String provider;
  int quantity;

  CartItem({
    required this.name, required this.price, required this.imagePath,
    required this.color, required this.provider, this.quantity = 1,
  });
}

// Este es el Gestor de Estado
class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Función para agregar al carrito
  void addItem(String name, String price, String imagePath, dynamic color, String provider) {
    int index = _items.indexWhere((item) => item.name == name);
    if (index != -1) {
      _items[index].quantity++; // Si ya existe, suma 1
    } else {
      _items.add(CartItem(name: name, price: price, imagePath: imagePath, color: color, provider: provider));
    }
    notifyListeners(); // Avisa a la app que algo cambió
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item); // Si llega a 0, lo borra
    }
    notifyListeners();
  }

  int get totalItems {
    return _items.fold(0, (total, item) => total + item.quantity);
  }

  double get totalPrice {
    return _items.fold(0, (total, item) => total + (double.parse(item.price) * item.quantity));
  }
}