import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantcare/notification_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/search/search_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/userproducts/flower_pageview.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/userproducts/miniplant_pageview.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/userproducts/plant_pageview.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final imgLIst = [
    "assets/images/girl_with_plant_2-removebg-preview.png",
    "assets/images/girl_with _flower4.png",
    "assets/images/carousal_image_3-removebg-preview.png"
  ];

  final colorList = [
    const Color(0xFFb0b4a3),
    const Color(0xFFc4bf89),
    const Color(0xFF776555),
  ];
  final Textsub = [
    "Get your 1st\nplant @ 60% off",
    "Buy 3 mini plant\nGet 1 pot Free!",
    "Get Buy 5 plant\nGet 1 plant Free! "
  ];
  final TextTitle = [
    "Exclusive\nOffer",
    "Exclusive\nOffer",
    "Exclusive\nOffer"
  ];

  final textColor = [
    Colors.indigo[800],
    Colors.white,
    Colors.pink[200],
  ];

  final plantColor = [
    Colors.blue[100],
    Colors.orange[200],
    Colors.pink[100],
    Colors.purple[100],
    Colors.yellow[200],
    Colors.grey[400],
    Colors.green[300],
    Colors.blue[100],
    Colors.orange[200],
    Colors.pink[100],
    Colors.purple[100],
    Colors.yellow[200],
    Colors.grey[400],
    Colors.green[300],
    Colors.blue[100],
    Colors.orange[200],
    Colors.pink[100],
    Colors.purple[100],
    Colors.yellow[200],
    Colors.grey[400],
    Colors.green[300],
  ];

  final _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Good Morning!\nSarah",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      // margin: EdgeInsets.all(0),
                      // padding: const EdgeInsets.only(left: 1, right: 1),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green.shade800,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationSCreen()));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.green[800],
                            size: 30,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CarouselSlider.builder(
                  itemCount: imgLIst.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgLIsts = imgLIst[index];
                    return buildImage(imgLIsts, index);
                  },
                  options: CarouselOptions(
                      height: 180,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.green.shade800, width: 3.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "  Search here....",
                        style: TextStyle(color: Colors.grey[800], fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlantPageView()));
                    },
                    child: Container(
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                          //  color: Colors.red,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/plantbgimage2.jpg'),
                              fit: BoxFit.cover)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Explore Your\nFavourite Plants",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color.fromARGB(255, 21, 86, 24)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kHeight10,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FlowerPageView(plantColor: plantColor)));
                    },
                    child: Container(
                      height: 180,
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Shop The\nbestFlowers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color.fromARGB(255, 180, 4, 107)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/images/flowersbg5.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  kHeight10,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MiniPlantPageView(plantColor: plantColor)));
                    },
                    child: Container(
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/miniplantbg9.jpg'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Decor Your Home\nWith MiniPlants",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color.fromARGB(255, 30, 125, 34)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildImage(String imgLIsts, int index) => Container(
      decoration: BoxDecoration(
          color: colorList[index], borderRadius: BorderRadius.circular(10)),
      width: 500,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                imgLIsts,
                // fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140, top: 50),
                child: Text(
                  TextTitle[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: textColor[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140, top: 120),
                child: Text(
                  Textsub[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: textColor[index]),
                ),
              )
            ],
          ),
        ],
      ));
}
