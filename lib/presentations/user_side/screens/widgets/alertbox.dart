import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

showloggedOutAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Logout',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: const Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Logout"),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      );
    },
  );
}
