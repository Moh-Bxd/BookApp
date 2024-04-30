import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/Book.dart';
import '../Constants.dart';

class Cards extends StatelessWidget {
  final Book book;
  const Cards({
    super.key, required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only( left: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Container(
              width: 121,
              height: 170,
              color: listBackground,
              child: Image.asset(
                "assets/image 29.png",
                fit: BoxFit.fill,

              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Container(
              height: 95,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [shadow]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      book.category,
                      style: styleGenreAuthorSmall,
                    ),
                    const Spacer(flex: 1,),

                    Row(
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            book.name,
                            style: styleSmallName,
                            textAlign: TextAlign.justify,


                          ),
                        )
                      ],
                    ),
                    const Spacer(flex: 1,),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${book.price} DZD",
                          style: priceSmall,
                        ),
                        const Text("Trade",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),)
                      ],
                    ),
                    const Spacer(flex: 2,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}