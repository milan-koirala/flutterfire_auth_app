import 'package:flutter/material.dart';
import 'package:flutterfire_auth/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_auth/pages/cart_page.dart';
import 'package:flutterfire_auth/services/noti_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Notification Service
  NotiService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        "/cart_page": (context) => const CartPage(),
      },
    );
  }
}
