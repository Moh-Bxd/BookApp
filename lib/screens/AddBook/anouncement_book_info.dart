

import 'package:cpi_project/main.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../Constants.dart';
import '../new_announcement/announcement_book_body.dart';
import '../new_announcement/anouncement_header.dart';

class NewAnnouncement extends StatelessWidget {
  const NewAnnouncement({super.key,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: const Text(
              "Create a new Book",
              style: titleAppBar,
            ),
            centerTitle: true,
            backgroundColor: appbarColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
            leading: IconButton(
              color: Colors.black,
              icon: LineIcon.arrowLeft(),
              onPressed: () {},
            ),
          ),
        ),
        body: AnnouncementBody(),
      ),
    );
  }
}
