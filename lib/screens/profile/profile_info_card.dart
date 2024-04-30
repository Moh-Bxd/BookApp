import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileInfoCard extends StatelessWidget {

  final String leadingText;
  final String data;

  const ProfileInfoCard({super.key, required this.leadingText, required this.data});

  @override
  Widget build(BuildContext context) {
    return  Card(
            shadowColor: Color(0xff000000),
            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
            elevation: 8,
            child: ListTile(
             leading: Padding(
               padding: EdgeInsets.all(5.0),
               child: Text(
                leadingText,
                style: TextStyle(
                  color: Color(0xff252525),
                  fontSize: 15,
                ),
               ),
             ),
            title: Text(
              data,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
                fontSize: 16,
              ),
            ),
            ),
          );
  }
}