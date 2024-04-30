import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PurpleDivider extends StatelessWidget {
  const PurpleDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 140,
        height: 7,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        begin: Alignment(-1.0, -1.0),
        end: Alignment(1.0, 1.0),
        transform: GradientRotation(111.87 * 3.141592 / 180),
        stops: [0.0797, 0.0796, 1.0],
        colors: [
          Color.fromRGBO(214, 35, 185, 0),
          Color.fromRGBO(214, 35, 185, 1),
          Color.fromRGBO(105, 26, 182, 1),
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ],
      ),
    );
  }
}