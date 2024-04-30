import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../components/SearchBar.dart';
import '../new_announcement/anouncement_header.dart';
import 'message.dart';

class Chat extends StatelessWidget {
   Chat({super.key});
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD9D9D9),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC0ABDB),
          title: AnouncementHeader(screenWidth: screenWidth, text: "      Conversation"),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),

        body: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              SearchBar(searchController: search),
              SizedBox(height: 30,),
              Message(imagePath: "assets/user1.png", text1: "Athalia Putri", text2: "Last seen yesterday"),
              Message(imagePath: "assets/user2.png", text1: "Erlan Sadewa", text2: "Online"),
              Message(imagePath: "assets/user3.png", text1: "Midala Huera", text2: "Last seen 30 minutes ago"),
              Message(imagePath: "assets/user4.png", text1: "Nafisa Gitari", text2: "Online"),
              Message(imagePath: "assets/user5.png", text1: "Raki Devon", text2: "Online"),
              Message(imagePath: "assets/user6.png", text1: "Salsabila Akira", text2: "Last seen 3 hours ago"),
            ],
          ),
        ),
      ),
    );
  }
}