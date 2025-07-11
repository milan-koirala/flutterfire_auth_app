class Product {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String category;
  int quantity; // for cart

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    this.category = 'General',
    this.quantity = 1,
  });

  Product copyWithQuantity(int newQty) {
    return Product(
      id: id,
      name: name,
      description: description,
      imagePath: imagePath,
      price: price,
      category: category,
      quantity: newQty,
    );
  }

  double get totalPrice => price * quantity;
}