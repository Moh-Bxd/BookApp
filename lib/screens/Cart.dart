import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cpi_project/components/Command.dart';
import 'package:cpi_project/Constants.dart';
import 'package:cpi_project/components/Empty.dart';
import 'package:cpi_project/components/MyNavBar.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../components/BestDealsCard.dart';
import '../data/CartProvider.dart';
import '../models/Book.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex = 0;
  late CartProvider cartProvider;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: cartProvider,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Cart",
              style: titleAppBar,
            ),
            centerTitle: true,
            backgroundColor: appbarColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
          backgroundColor: backgroundColor,
          body: Consumer<CartProvider>(
            builder: (context, value, child) {
              if (cartProvider.cartItems.isEmpty) {
                return const Empty();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              top: 20,
                              bottom: 15,
                            ),
                            child: Text(
                              "Your Commands :",
                              style: mainText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 530,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: cartProvider.cartItems.length,
                                itemBuilder: (context, index) {
                                  return Command(
                                    book: cartProvider.cartItems[index], delete: true,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: mainText,
                          ),
                          Text(
                            "500 dzd".toUpperCase(),
                            style: mainText,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
