import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  final List<Map<String, String>> favorites = const [
    // for testing purpose
    {'image': 'assets/shoe1.png', 'name': 'Nike Air Max', 'price': '\$120.00'},
    {'image': 'assets/shoe2.png', 'name': 'Adidas Ultraboost', 'price': '\$150.00'},
    {'image': 'assets/shoe1.png', 'name': 'Puma RS-X', 'price': '\$110.00'},
    {'image': 'assets/shoe1.png', 'name': 'K-Swiss Vista', 'price': '\$85.00'},
    {'image': 'assets/shoe2.png', 'name': 'RS-X Women', 'price': '\$85.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Image.asset(item['image']!, width: 50, height: 50),
              title: Text(
                item['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['price']!),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // handle remove favorite
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
