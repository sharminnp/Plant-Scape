import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing});

  final String title;
  final String subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 20),
      child: Container(
        height: 80,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: ListTile(
            leading: const Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            title: Text(
              title,
              style: const TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                  // fontSize: 20,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            trailing: trailing),
      ),
    );
  }
}
