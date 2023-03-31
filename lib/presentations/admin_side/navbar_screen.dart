import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/admin_side/admin_order.dart';
import 'package:plant_app/presentations/admin_side/admin_products.dart';
import 'package:plant_app/presentations/admin_side/admin_profile/admin_profile.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final adminScreens = [
    const AdminOrders(),
    const AdminProducts(),
    const AdminProfile()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[800],
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white70,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "order"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Products"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
