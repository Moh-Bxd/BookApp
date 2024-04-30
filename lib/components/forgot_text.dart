import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotText extends StatelessWidget {

  final String text1;
  final String text2;
  const ForgotText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: RichText(text:  TextSpan(
                    children: [
                      TextSpan(text: text1,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff000000),
                      )),
                
                      //Signin text
                      TextSpan(
                        text: text2,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                
                        ..onTapDown =(details) {
                          
                        }
                
                
                        ..onTap =() {
                          
                                  
                        },
                      
                      ),
                
                    ],
                  ),
                  ),
                );
  }
}