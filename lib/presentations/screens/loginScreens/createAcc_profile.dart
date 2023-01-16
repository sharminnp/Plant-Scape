import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/home/homeScreen.dart';
import 'package:plant_app/presentations/screens/loginScreens/createAcc.dart';
import 'package:plant_app/presentations/screens/widgets/text_field.dart';

class CreateAccProfile extends StatelessWidget {
  const CreateAccProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 350, top: 15),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccount()));
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
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
              padding: const EdgeInsets.only(top: 70),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 110, top: 13),
                    child: Text("Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
