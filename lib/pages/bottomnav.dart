import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/Order.dart';
import 'package:myapp/pages/Profile.dart';
import 'package:myapp/pages/homepage.dart';

class BottamNav extends StatefulWidget {
  const BottamNav({super.key});

  @override
  State<BottamNav> createState() => _BottamNavState();
}

class _BottamNavState extends State<BottamNav> {
  late List<Widget> pages;

  late Home HomePage;
  late Order order;
  late Profile profile;
  int currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomePage = Home();
    order = Order();
    profile = Profile();
    pages = [HomePage, order, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Color.fromARGB(255, 234, 235, 231),
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Icon(Icons.person_outlined, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
