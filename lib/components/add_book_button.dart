import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddBookButton extends StatelessWidget {


   
  const AddBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
             onPressed : () {},
             child: const Text('upload book image',style: TextStyle(
              color: Color(0xff000000),
              fontSize: 15,
            ),)
            
            
             );
  }
}