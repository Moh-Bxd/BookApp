import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpHeader extends StatelessWidget {

  final double screenWidth;
   const SignUpHeader({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/black_arrow.png',)),
            ),
          ),
          SizedBox(width: screenWidth*0.3),

          const Text("Register",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 25,
          ),),
        ],
      ),
    );
  }
}