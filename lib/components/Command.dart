import 'package:cpi_project/data/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../models/Book.dart';
import '../Constants.dart';
import 'Button.dart';

class Command extends StatelessWidget {
  final Book book;
  final bool delete;

  const Command({required this.book, required this.delete, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7 ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          boxShadow: const [shadow]),

          width: double.infinity,
          height: 160,
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
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  book.category,
                                  style: styleGenrecategory,
                                ),
                                (delete == true)?IconButton(onPressed: () {
                                  Provider.of<CartProvider>(context,listen:false).removeFromCart(book.id);

                                }, icon: LineIcon.trash()):SizedBox()//do nothing
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              book.name,
                              style: styleName,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              "Author :${book.author}",
                              style: styleGenreAuthor,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${book.price} DZD",
                                  style: price,
                                ),
                                GestureDetector(
                                    onTap: () {

                                    },
                                    child: const LoginButton(showText: 'Contact Seller',width: 100,height: 35,borderRadius: 5,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
