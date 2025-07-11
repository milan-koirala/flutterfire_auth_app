import 'package:flutter/material.dart';
import 'package:flutterfire_auth/models/product.dart';

class Shop with ChangeNotifier {
  final List<Product> _shop = [
    Product(
      id: '1',
      name: 'Apple iPhone 14 4GB 256GB',
      description: 'Powerful phone with great display and storage.',
      imagePath: 'assets/iphone14.jpeg',
      price: 150000,
    ),
    Product(
      id: '2',
      name: 'Smart Watch 2',
      description: 'Track fitness and stay connected.',
      imagePath: 'assets/digitalwatch.jpg',
      price: 4999,
    ),
    Product(
      id: '3',
      name: 'Realme Charger',
      description: 'Fast, reliable charging.',
      imagePath: 'assets/mobilecharger.jpeg',
      price: 1599,
    ),
    Product(
      id: '4',
      name: 'Apple Headset 2025',
      description: 'Clear sound, perfect for calls and music.',
      imagePath: 'assets/headphone.jpg',
      price: 25999,
    ),
  ];

  final List<Product> _cart = [];
  final List<Product> _wishlist = [];
  final List<Product> _selectedForCheckout = [];

  // Getters
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  List<Product> get wishlist => _wishlist;
  List<Product> get selectedForCheckout => _selectedForCheckout;

  // Cart Logic
  void addToCart(Product product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].quantity += 1;
    } else {
      _cart.add(product.copyWithQuantity(1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Checkout Logic
  void toggleProductSelection(Product product, bool isSelected) {
    if (isSelected) {
      if (!_selectedForCheckout.contains(product)) {
        _selectedForCheckout.add(product);
      }
    } else {
      _selectedForCheckout.remove(product);
    }
    notifyListeners();
  }

  void clearSelectedForCheckout() {
    _selectedForCheckout.clear();
    notifyListeners();
  }

  // Wishlist Logic
  void toggleWishlist(Product product) {
    final exists = _wishlist.any((item) => item.id == product.id);
    if (exists) {
      _wishlist.removeWhere((item) => item.id == product.id);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.any((item) => item.id == product.id);
  }
}
