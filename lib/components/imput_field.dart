import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImputField extends StatelessWidget {

  final bool obsecureText;
  final controller;
  final String hintText;
  final TextInputType keyboardInputType;
  final  fillHintType;

  const ImputField({super.key, required this.obsecureText, required this.controller, required this.hintText, required this.keyboardInputType, this.fillHintType});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      //wrapped with card to use elevation property
      child: Card(
        elevation: 3,
        child: TextField(
        
      
          //this property is set to true only in password imput field to hide what have been written
          obscureText: obsecureText,
          
          //is used to get data from imput field during execusion
          controller: controller,
          //? customazing its appearence during its lifetime
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xff252525),
            ),
            fillColor: Color(0xffFFFFFF),
            filled: true,
      
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff5921AD),
                width: 2
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFFFFF),
              ),
            ),
            
          
          ),
      
          keyboardType: keyboardInputType,
      
          autofillHints: fillHintType ,
        
          
          
          
        ),
      ),
    );
  }
}