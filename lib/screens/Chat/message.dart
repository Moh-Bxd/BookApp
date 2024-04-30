import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Message extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;
  const Message({super.key, required this.imagePath, required this.text1, required this.text2});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 40,),
          Image(image: AssetImage(imagePath)),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 15,),
                  Text(text1, style: TextStyle(
                    color: Color(0xff0F1828),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 10,),
                  Text(text2, style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,)),
                    SizedBox(height: 20,),
                    Container(
                      height: 2,
                      width:252,
                      color: Color(0xffffffff),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}