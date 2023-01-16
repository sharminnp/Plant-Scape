import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/home/pages/profile/profile_screen.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Address"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          AddressFunction(title: "Home", subtitle: "NH nagar payyanur kannur"),
          AddressFunction(
              title: "Office", subtitle: "cheruvathur, kasargod ,kerala"),
          AddressFunction(title: "School", subtitle: "ghss scholl elembachi"),
          Padding(
            padding: const EdgeInsets.only(top: 370),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 8),
                child: Text("Add Location",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }

  Widget AddressFunction({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 20),
      child: Container(
        height: 80,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
                // fontSize: 20,
                //fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
