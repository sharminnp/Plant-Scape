import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/presentations/admin_side/admin_order.dart';
import 'package:plant_app/presentations/admin_side/admin_products.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final adminScreens = [AdminOrders(), AdminProducts()];
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
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "order"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Products"),
          ]),
    );
  }
}
