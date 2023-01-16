import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/home/pages/cart/card_screen.dart';
import 'package:plant_app/presentations/screens/home/pages/main_Screen.dart';
import 'package:plant_app/presentations/screens/home/pages/order/order_screen.dart';
import 'package:plant_app/presentations/screens/home/pages/profile/profile_screen.dart';
import 'package:plant_app/presentations/screens/home/pages/whishlist/whishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int currentIndex = 0;
  final screens = [
    MainScreen(),
    CardScreen(),
    const OrderScreen(),
    const WhishlistScreen(),
    const ProfileScreen()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[800],
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white70,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Order"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Whishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
