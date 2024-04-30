import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PleaseText extends StatelessWidget {

  final String txt;
  const PleaseText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please fill your details to $txt",
      style: const TextStyle(
        color: Color(0xff626161),
        fontSize: 16,
      ),
    );
  }
}