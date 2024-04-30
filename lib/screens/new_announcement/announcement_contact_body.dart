
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../components/Button.dart';
import '../../components/imput_field.dart';
import '../../texts/announcement_text.dart';

class AnnouncementContactBody extends StatefulWidget {
  const AnnouncementContactBody({super.key});

  @override
  State<AnnouncementContactBody> createState() => _AnnouncementContactBodyState();
}

class _AnnouncementContactBodyState extends State<AnnouncementContactBody> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 15,),
            //contact info text
             AnnouncementText(text: "Contact info : "),
             SizedBox(height: 20,),
             AnnouncementText(text: "Full Name "),
             ImputField(obsecureText: false, controller: nameController, hintText: "", keyboardInputType: TextInputType.text),
             AnnouncementText(text: "Email Adress "),
             ImputField(obsecureText: false, controller: emailController, hintText: "Please enter your email", keyboardInputType: TextInputType.emailAddress),
             AnnouncementText(text: "Phone Number "),
             ImputField(obsecureText: false, controller: phoneNumberController, hintText: "Please enter your phone number", keyboardInputType: TextInputType.phone),
             AnnouncementText(text: "City "),
             ImputField(obsecureText: false, controller: cityController, hintText: "In Which City You Live ?", keyboardInputType: TextInputType.phone),
             AnnouncementText(text: "Region "),
             ImputField(obsecureText: false, controller: regionController, hintText: "Wich Region?", keyboardInputType: TextInputType.phone),
             SizedBox(height: 40,),
             //submit button
             LoginButton(showText: "Submit", borderRadius: 8, height: 50, width: screenWidth*0.9),
             SizedBox(height: 40,),
          
          
          ],
          
          
        ),
      ),
    );
  }
}