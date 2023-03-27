import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/address_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/edit_profile.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/helping_center.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/alertbox.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Stack(
                children: [
                  // Image.asset("assets/images/girl_with _flower4.png"),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65, top: 50),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 40,
                      ),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          listtileFunction(
              icons: Icons.edit,
              text: 'Edit Profile',
              ontap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfile()));
              }),
          listtileFunction(
              icons: Icons.location_on,
              text: 'Address',
              ontap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdressScreen()));
              }),
          listtileFunction(
              icons: Icons.help_center,
              text: 'helping Center',
              ontap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpingCenterScreen()));
              }),
          listtileFunction(
              icons: Icons.privacy_tip, text: 'Privcy Policy', ontap: () {}),
          listtileFunction(
              icons: Icons.logout,
              text: "Log out",
              ontap: () {
                showloggedOutAlert(context: context);
              })
        ],
      ),
    );
  }

  Widget listtileFunction(
      {required IconData icons,
      required String text,
      required void Function() ontap}) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )),
    );
  }
}
