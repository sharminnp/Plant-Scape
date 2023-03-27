import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/profile_screen.dart';

class HelpingCenterScreen extends StatelessWidget {
  const HelpingCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Helping center"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          HelpingCenterFunction(
              title: "Whatsapp", Icons: Icons.chat_bubble_rounded),
          HelpingCenterFunction(title: "Website", Icons: Icons.message),
          helpingText(
              title: "What is Plantscape",
              subtitle:
                  "If you have spent any time outside in the past week you've probably noticed that wildflowers are coming up. If you have a smartphone, you actually have the ability to determine precisely what kind of wildflower (or plant, or tree) it is you are looking at."),
          helpingText(
              title: "How to buy plant",
              subtitle:
                  "by adding cart and you can order and it will deliverv to your home\nby using payment methods\n"),
          helpingText(
              title: "How to cancel a order",
              subtitle:
                  "there is an option in order you can cancel with that\ngo to orders\nselect orderd item\ntheres a cancel option\nyou can confirm that")
        ],
      ),
    );
  }

  Widget HelpingCenterFunction(
      {required String title, required IconData Icons}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 20),
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Icon(
            Icons,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          // subtitle: Text(subtitle),
          // trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ),
      ),
    );
  }

  Widget helpingText({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 20),
      child: Container(
        height: 140,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          //leading: Icon(Icons.location_on),
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
          //trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ),
      ),
    );
  }
}
