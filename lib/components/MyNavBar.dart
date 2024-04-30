import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cpi_project/screens/Cart.dart';
import 'package:cpi_project/screens/Description.dart';
import 'package:cpi_project/screens/HomePage.dart';
import 'package:cpi_project/screens/Offers.dart';
import 'package:cpi_project/screens/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants.dart';
import '../routes/RouteGenerator.dart';
import '../screens/AddBook/anouncement_book_info.dart';
import '../screens/AddBook/anouncement_book_info.dart';
import '../screens/AddBook/anouncement_book_info.dart';
import '../screens/Chat/chat.dart';
import '../screens/new_announcement/anouncement_book_info.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int current = 0;

  List<String> iconss = [
    "assets/home.png",
    "assets/cart.png",
    "assets/chat.png",
    "assets/profile.png"
  ];

  final autoSizeGroup = Chat();
  List<String> labels = ["Home", "Cart", "Chat", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            [ HomePage(),  Cart(), Chat(),  Profile()][current],
          ],
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedBottomNavigationBar.builder(
              onTap: (index) {
                setState(() {
                  current = index;
                });
              },
              itemCount: 4,
              activeIndex: current,
              backgroundColor: navColor,
              splashColor: ourpurple,
              notchMargin: -10,
              notchSmoothness: NotchSmoothness.sharpEdge,
              gapLocation: GapLocation.center,
              leftCornerRadius: 30,
              rightCornerRadius: 30,
              hideAnimationCurve: Curves.fastOutSlowIn,
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconss[index],
                      color: isActive == true ? ourpurple : Colors.white,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Visibility(
                      visible: isActive ? true : false,
                      child: AutoSizeText(
                        labels[index],
                        maxLines: 1,
                        style: TextStyle(
                            color: isActive == true ? ourpurple : Colors.white),
                      ),
                    )
                  ],
                );
              },
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 17,
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    boxShadow: [shadow],
                    color: ourpurple,
                     shape: BoxShape.circle ,


                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteGenerator.addBook,
                      );
                    }, icon: const Icon(CupertinoIcons.add,color: Colors.white,),
                  ),
                ))
          ],
        ));
  }
}
