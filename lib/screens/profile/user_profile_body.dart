
import 'package:cpi_project/screens/profile/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../components/Button.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
         children: [
          SizedBox(height: 40,),
          ClipOval(child: Image(image: AssetImage('assets/images/user.png'))),
          SizedBox(height: 30,),

          
          ProfileInfoCard(leadingText: "Name :", data: "John Doe"),
          ProfileInfoCard(leadingText: "E-mail:", data: "johndoe123@mail.com"),
          ProfileInfoCard(leadingText: "Password:", data: "*********"),
          ProfileInfoCard(leadingText: "Address:", data: " No.23, James Street, New Town, North Province"),
          SizedBox(height: 25,),
          Row(
            children: [
              LoginButton(showText: "Edit", borderRadius: 8, height: 45, width: 150),
              LoginButton(showText: "Log out", borderRadius: 8, height: 45, width: 150),
            ],
          ),

          
            

         ],

        ),
      ),
    );
  }
}