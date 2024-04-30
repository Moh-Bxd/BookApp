import 'dart:convert';

import 'package:cpi_project/components/MyNavBar.dart';
import 'package:cpi_project/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Button.dart';
import '../../components/devider.dart';
import '../../components/forgot_text.dart';
import '../../components/imput_field.dart';
import '../../models/host.dart';
import '../../routes/RouteGenerator.dart';
import '../../texts/please_fill_txt.dart';
import '../sign_up/sign_up.dart';
import 'header_widget.dart';

class SignInPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInPage({super.key, });


  // Function that saves the token in shared preferences
  Future<void> storeAuthToken(String authToken) async {
    print(authToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
  }

  // Function that retrieves the token from shared preferences with the token key
  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> signIn() async {
    // API endpoint for sign-in
     final url = 'http://$host:3111/api/signin';

    try {
      print("1");
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': emailController.text.toString(),
          'password': passwordController.text.toString(),
        }),
      );
      print("2");

      if (response.statusCode == 200) {
        print("3");
        // Sign-in successful
        // Extract the authentication token from the response body
        final responseBody = jsonDecode(response.body);
        final authToken = responseBody['token'];
        // Store the authentication token or user session data
        if (authToken != null) {
          await storeAuthToken(authToken);
          print("Token stored successfully! $authToken");
          var s = await getAuthToken();
          print("token$s");

          // Update the authentication state in your app
          // Proceed to the next screen or perform any necessary actions
          // Navigator.pushReplacement(
          //   contextt,
          //   MaterialPageRoute(builder: (context) => SignUpPage(context: contextt)),
          // );
        } else {

          // Sign-in failed
          // Handle the error response from the API
          // Show appropriate error messages or take necessary actions
        }
      }
      else{
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        print('Response Headers: ${response.headers}');

      }
    } catch (e) {
      // Handle any errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffD9D9D9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(height: 100,),
              const Text(
                "BOOK-Hub",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const PurpleDivider(),
              const SizedBox(height: 50,),
              // Please text
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 15, 0),
                    child: PleaseText(txt: 'login.'),
                  ),
                ],
              ),
              ImputField(
                obsecureText: false,
                controller: emailController,
                hintText: 'Email',
                keyboardInputType: TextInputType.emailAddress,
              ),
              ImputField(
                obsecureText: true,
                controller: passwordController,
                hintText: 'Password',
                keyboardInputType: TextInputType.text,
              ),
              const SizedBox(height: 35,),

              GestureDetector(
                onTap: () {
                  signIn();
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.homeRoute,
                  );;
                },
                child: LoginButton(
                  showText: 'Login',
                  borderRadius: 8,
                  height: 50,
                  width: screenWidth * 0.9,
                ),
              ),
              const SizedBox(height: 20,),
              const ForgotText(text1: "", text2: "forgot password ?"),
              const SizedBox(height: 20,),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.signUpPage,
                  );
                },
                child: ForgotText(text1: "New member?", text2: "Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
