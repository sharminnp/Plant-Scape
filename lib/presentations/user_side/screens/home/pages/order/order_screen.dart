import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/order_model.dart';

import 'package:plant_app/presentations/user_side/screens/home/pages/order/active_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/completed_Screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          elevation: 0,
          title: Text('My Orders'),
          centerTitle: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveScreen(),
            CompletedScreen(),
          ],
        ),
      ),
    );
  }
}
