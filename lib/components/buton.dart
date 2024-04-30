import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {
    final String showText; 
    final double borderRadius;
    final double height;
    final double width;
    
    

  const LoginButton({super.key,required this.showText, required this.borderRadius, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {

    return Container(
     width: width,
      height: height,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
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
      
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(showText,style: const TextStyle(
        color: Color(0xffFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 15 ,
      ),textAlign: TextAlign.center,),
    
      
    ],
    ),
      );
  }
}