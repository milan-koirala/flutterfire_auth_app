import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback onSignOut;

  const MyDrawer({super.key, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person, color: Colors.white, size: 40),
                const SizedBox(height: 10),
                Text(
                  user?.email ?? "User",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Exit'),
            onTap: () {
              Navigator.pop(context);
              onSignOut(); // Call the passed callback
            },
          ),
        ],
      ),
    );
  }
}
