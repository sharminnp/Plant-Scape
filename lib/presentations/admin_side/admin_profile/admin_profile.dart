import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/admin_side/admin_profile/promo_code/promo_code_screen.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PromoCodeScreen(),
                  ),
                );
              },
              leading: const Text(
                "Promo code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: const Text(
                "Log out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
