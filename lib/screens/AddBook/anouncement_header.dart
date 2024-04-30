import 'package:flutter/material.dart';

class AnouncementHeader extends StatelessWidget {
  final double screenWidth;
  final String text;

  const AnouncementHeader({Key? key, required this.screenWidth, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/black_arrow.png'),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.12),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
