import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/presentations/admin_side/admin_active.dart';
import 'package:plant_app/presentations/admin_side/admin_canceled.dart';
import 'package:plant_app/presentations/admin_side/admin_completed.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/active_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/completed_Screen.dart';

class AdminOrders extends StatelessWidget {
  const AdminOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Tab(
                text: 'Cancelled',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AdminActiveScreen(),
            AdminCompletedScreen(),
            AdminCanceled()
          ],
        ),
      ),
    );
  }
}
