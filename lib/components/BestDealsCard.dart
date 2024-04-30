import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/Book.dart';
import '../Constants.dart';

class BestDealsCard extends StatelessWidget {
  final Book book;
  const BestDealsCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(10),
      child: Container(

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),boxShadow: const [shadow]),
        margin: const EdgeInsets.only(left: 25,right: 25,bottom: 7 ),
        height: 145,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10)
        ),
              child: Container(
                width: 110,
                // child: Image(image: AssetImage('assets/book_cover.png'),
                child: Image.asset(
                  "assets/image 29.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          book.category,
                          style: styleGenreAuthor,
                        ),
                      ],
                    ),
                    const Spacer(),

                    // SizedBox(
                    //   height: ,
                    // ),
                    Row(
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            book.name,
                            textAlign: TextAlign.justify,
                            style: styleName,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          book.author,
                          style: styleGenreAuthor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${book.price} DZD",
                          style: price,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ourpurple,
                            foregroundColor: Colors.black,
                            disabledForegroundColor:
                                book.forTrade == false ? Colors.white : null,
                            disabledBackgroundColor:
                                book.forTrade == false ? Colors.white : null,
                            // Change the cursor to not-allowed if forTrade is false
                            disabledMouseCursor: book.forTrade == false
                                ? MouseCursor.defer
                                : null,
                          ),
                          onPressed: book.forTrade == true
                              ? () {

                                }
                              : null, // Disable the button if forTrade is false
                          child: Text("Trade",
                              style:
                                  book.forTrade == true ? buttonPrice : null),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
