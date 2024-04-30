import 'package:flutter/material.dart';

import '../Constants.dart';
class Chips extends StatelessWidget {
  final int index;
  final int current;
  final String chip;
  const Chips({Key? key,required this.index,required this.current,required this.chip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: const BoxConstraints(
          maxWidth: double.infinity,
          minWidth: 70,
          maxHeight: 50),
      decoration: BoxDecoration(
        boxShadow: const [shadow],
          color: current == index ? ourpurple : tabColor,
          borderRadius: current == index
              ? BorderRadius.circular(10)
              : BorderRadius.circular(6)),
      margin: const EdgeInsets.only(top: 5,bottom: 10,left: 10),
      duration: const Duration(milliseconds: 300),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              chip,
              style: TextStyle(
                  fontSize: 16,
                  color: current == index
                      ? Colors.white
                      : Colors.white54),
            ),
          )),
    );
  }
}
