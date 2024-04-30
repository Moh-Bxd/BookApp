import 'package:cpi_project/screens/sign_up/sign_up_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import '../../components/Button.dart';
import '../../components/imput_field.dart';
import '../../models/host.dart';
import '../../texts/please_fill_txt.dart';
import '../sign_in/sign_in.dart';

class SignUpPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpPage({
    super.key,
  });

  Future<void> signUp() async {
    var url = "http://$host:3111/api/signup";
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'name': userNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);

    //Navigator.pushReplacementNamed(context, '/signIn');

    if (response.statusCode == 200) {
      // Successful sign-up
      var user = data['user'];
      var token = data['token'];

      // Handle the user data and token as needed
      print("User-----------------: $data");

      // Navigate to another screen upon successful sign-up

      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    } else {
      // error, handle the error message
      var errorMessage = data['error'];
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffD9D9D9),

        //page upper side
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: SignUpHeader(screenWidth: screenWidth),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              //this row contains please fill info text
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: PleaseText(txt: "SignUp"),
                  ),
                ],
              ),
              //This column contains the imput fields
              Column(
                children: [
                  ImputField(
                      controller: userNameController,
                      obsecureText: false,
                      hintText: "Username",
                      keyboardInputType: TextInputType.name,
                      fillHintType: [AutofillHints.name]),
                  ImputField(
                      controller: emailController,
                      obsecureText: false,
                      hintText: "Email",
                      keyboardInputType: TextInputType.emailAddress,
                      fillHintType: [AutofillHints.email]),
                  ImputField(
                      controller: passwordController,
                      obsecureText: true,
                      hintText: "Password",
                      keyboardInputType: TextInputType.visiblePassword,
                      fillHintType: [""]),
                  ImputField(
                      controller: confirmPasswordController,
                      obsecureText: true,
                      hintText: "Confirm Password",
                      keyboardInputType: TextInputType.visiblePassword,
                      fillHintType: [""]),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.08,
              ),

              //This column contains the get started button and signin text
              Column(
                children: [
                  GestureDetector(
                      //the logic of sign up**********************************************************
                      onTap: () {
                        signUp();
                      },
                      child: LoginButton(
                          showText: "GET STARTED",
                          borderRadius: 12,
                          height: 50,
                          width: screenWidth * 0.8)),
                  SizedBox(height: screenHeight * 0.17),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Already a member?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff000000),
                              )),

                          //Signin text
                          TextSpan(
                            text: "Sign in",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTapDown = (details) {}
                              ..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
