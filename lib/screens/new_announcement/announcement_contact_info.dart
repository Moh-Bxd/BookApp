import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'announcement_contact_body.dart';
import 'anouncement_header.dart';

class AnnouncementContactInfo extends StatefulWidget {
  
   AnnouncementContactInfo({super.key});

  @override
  State<AnnouncementContactInfo> createState() => _AnnouncementContactInfoState();
}

class _AnnouncementContactInfoState extends State<AnnouncementContactInfo> {


 
  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC0ABDB),
          title: AnouncementHeader(screenWidth: screenWidth, text: "Create New Announcement"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),

      body: AnnouncementContactBody(),



    );
  }
}