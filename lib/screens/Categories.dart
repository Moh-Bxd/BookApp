import 'package:cpi_project/components/SearchBar.dart';
import 'package:cpi_project/models/category.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../Constants.dart';
import '../components/MyNavBar.dart';
import '../data/BookProvider.dart';
import '../routes/RouteGenerator.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: titleAppBar,
        ),
        centerTitle: true,
        backgroundColor: appbarColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        leading: IconButton(
          color: Colors.black,
          icon: LineIcon.arrowLeft(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15,),
        child: GridView.builder(
          itemCount: chips.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.category,
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: backgroundColor,
                      ),
                      child: Image.asset(
                        "assets/Rectangle 11.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          chips[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "AdobeGaramond",
                              fontWeight: FontWeight.w300),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
