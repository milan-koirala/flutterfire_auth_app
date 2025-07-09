import 'package:flutter/material.dart';
import 'package:flutterfire_auth/components/my_bottom_navbar.dart';
import 'package:flutterfire_auth/pages/home_page.dart';
import 'package:flutterfire_auth/pages/notification_page.dart';
import 'package:flutterfire_auth/pages/user_profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages =  [
    HomePage(),
    NotificationPage(),
    UserProfilePage(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
