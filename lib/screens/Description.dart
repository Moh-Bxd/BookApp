import 'dart:convert';

import 'package:cpi_project/Constants.dart';
import 'package:cpi_project/components/MyNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;

import '../data/BookProvider.dart';
import '../data/CartProvider.dart';
import '../routes/RouteGenerator.dart';
import 'Cart.dart';

class Description extends StatelessWidget {
  final String bookId;

  const Description({Key? key, required this.bookId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool addedtofav =false;

    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(

        backgroundColor: backgroundColor,
        body: FutureBuilder<void>(
          future: bookProvider.fetchBookDetails(bookId),
          builder: (context, AsyncSnapshot<void> snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Consumer<BookProvider>(
                builder: (context, value, child) {
                  final bookDetails = bookProvider.book;
                  print(bookDetails);
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 15, left: 15, top: 5),
                              decoration: BoxDecoration(
                                  color: navColor,
                                  borderRadius: BorderRadius.circular(30)),
                              width: double.infinity,
                              height: 560,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.arrowLeft,
                                              color: Colors.black,
                                            )),
                                        Text(
                                          "${bookDetails?.category}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              final cartProvider =
                                              Provider.of<CartProvider>(context,
                                                  listen: false);
                                              cartProvider.addToFavorites(bookId);
                                              addedtofav = true;
                                            },
                                            icon:  Icon(
                                              FontAwesomeIcons.heart,
                                              color: (addedtofav == false)?Colors.black:Colors.red,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 300,
                                    width: 220,
                                    child: Image.asset(
                                      "assets/image 29.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${bookDetails?.name}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "By ${bookDetails?.author ?? ''}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  RatingBar(
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    itemSize: 18,
                                    minRating: 0,
                                    maxRating: 5,
                                    itemCount: 5,
                                    initialRating:
                                        bookDetails?.state.toDouble() ?? 0.0,
                                    ratingWidget: RatingWidget(
                                        full: const Icon(
                                          Icons.star,
                                          color: ourpurple,
                                        ),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: ourpurple,
                                        ),
                                        empty: const Icon(
                                          Icons.star_border,
                                          color: primaryColor,
                                        )),
                                    onRatingUpdate: (double value) {},
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -60,
                              right: 15,
                              left: 15,
                              child: Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                    boxShadow: const [shadow],
                                    color: listBackground,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: 48,
                                              height: 48,
                                              child: Image.asset(
                                                  "assets/ProfileSmalPic.png"),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  bookDetails
                                                          ?.contactInfo?.name ??
                                                      '',
                                                  style: GoogleFonts.lato(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  bookDetails?.dateUploaded
                                                          ?.toString() ??
                                                      '',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10, bottom: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                bookDetails?.typeSelling ==
                                                        "Trade"
                                                    ? "Accept Trade"
                                                    : "Just Selling",
                                                style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "${bookDetails?.price} DZD",
                                                style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: ReadMoreText(
                                  "${bookDetails?.description}",
                                  trimLines: 2,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  textAlign: TextAlign.justify,
                                  colorClickableText: Colors.black,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "Read more",
                                  trimExpandedText: " Less",
                                  moreStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => null,
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: ourpurple,
                                          foregroundColor: Colors.white,
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              40)),
                                      child: const Text(
                                        "Contact Seller",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final cartProvider = Provider.of<CartProvider>(context, listen: false);
                                        cartProvider.addToCart(bookId);
                                        Navigator.pushNamed(
                                          context,
                                          RouteGenerator.cart,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: ourpurple,
                                          foregroundColor: Colors.white,
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              40)),
                                      child: const Text(
                                        "Add to Cart",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
