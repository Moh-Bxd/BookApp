

import 'package:cpi_project/models/Contactinfo.dart';
import 'package:flutter/cupertino.dart';

class Book {
  final String id;
  final String name;
  final String author;
  final double price;
  final String category;
  final String image;
  final DateTime dateUploaded;
  final int state;
  final bool forTrade;
  final String typeSelling;
  final String description;
  final ContactInfo? contactInfo;
  final String user;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.category,
    required this.image,
    required this.dateUploaded,
    required this.state,
    required this.typeSelling,
    required this.description,
    this.contactInfo,
    required this.user,
    required this.forTrade,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'],
      name: json['name'],
      author: json['author'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      dateUploaded: DateTime.parse(json['dateUploaded']).toLocal(),
      state: json['state'],
      typeSelling: json['typeSelling'],
      description: json['description'],
      contactInfo: ContactInfo.fromJson(json['contactInfo'] as Map<String,dynamic>) ,
      user: json['user'],
      forTrade: json['typeSelling'] == "Trade" ? true : false,
    );
  }
}