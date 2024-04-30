import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnnouncementText extends StatelessWidget {

  final String text;
  const AnnouncementText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: Text(text,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
        ],
      ),
    );
  }
}