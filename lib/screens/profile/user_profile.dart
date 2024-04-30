
import 'package:cpi_project/screens/profile/user_profile_body.dart';
import 'package:cpi_project/screens/profile/user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
          //TODO : fix the spacing in the header to make the text show in the center !!
          title: UserProfileHeader(screenWidth: screenWidth, text: "Account"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),

      body: UserProfileBody(),


    );
  }
}