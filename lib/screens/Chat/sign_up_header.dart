import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatHeader extends StatelessWidget {

  final double screenWidth;
   ChatHeader({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/black_arrow.png',)),
            ),
          ),
          SizedBox(width: screenWidth*0.20),

          Text("Conversations",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 25,
          ),),
        ],
      ),
    );
  }
}