import 'package:flutter/material.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit profile"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Stack(
              children: [
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: textFieldWidget(
              hintText: "First Name",
              Icons: Icons.person,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: textFieldWidget(
              hintText: "Last Name",
              Icons: Icons.person,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: textFieldWidget(
              hintText: "Phone Number",
              Icons: Icons.phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 60, top: 8),
                child: Text("confirm",
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
}
