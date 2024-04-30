import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnouncementHeader extends StatelessWidget {
  final double screenWidth;
  final String text;
   AnouncementHeader({super.key, required this.screenWidth, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/black_arrow.png',)),
            ),
          ),
          SizedBox(width: screenWidth*0.12),

          Text(text,
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 20,
          ),),
        ],
      ),
    );
  }
}