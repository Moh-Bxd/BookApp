import 'package:cpi_project/components/MyNavBar.dart';
import 'package:cpi_project/data/BookProvider.dart';
import 'package:cpi_project/data/CartProvider.dart';
import 'package:cpi_project/routes/RouteGenerator.dart';
import 'package:cpi_project/screens/Cart.dart';
import 'package:cpi_project/screens/Categories.dart';
import 'package:cpi_project/screens/Category.dart';
import 'package:cpi_project/screens/Description.dart';
import 'package:cpi_project/screens/Profile.dart';
import 'package:cpi_project/screens/sign_in/sign_in.dart';
import 'package:cpi_project/screens/sign_up/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/HomePage.dart';
import 'screens/Offers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>.value(value: BookProvider()),
        ChangeNotifierProvider<CartProvider>.value(value: CartProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteGenerator.first,
            onGenerateRoute: RouteGenerator.generateRoute,
            home:  HomePage());
      },


    );
  }
}
