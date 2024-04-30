import 'package:cpi_project/components/MyNavBar.dart';
import 'package:cpi_project/models/category.dart';
import 'package:cpi_project/screens/AddBook/anouncement_book_info.dart';
import 'package:cpi_project/screens/Category.dart';
import 'package:cpi_project/screens/on_boarding_screen.dart';
import 'package:cpi_project/screens/sign_in/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/AddBook/announcement_book_body.dart';
import '../screens/Cart.dart';
import '../screens/Categories.dart';
import '../screens/Chat/chat.dart';
import '../screens/Description.dart';
import '../screens/HomePage.dart';
import '../screens/Offers.dart';
import '../screens/Profile.dart';
import '../screens/sign_up/sign_up.dart';

class RouteGenerator {
  static const String homeRoute = '/home';
  static const String signInPage = '/signInPage';
  static const String signUpPage = '/signUpPage';
  static const String profile = '/profile';
  static const String desc = '/description';
  static const String offers = '/offers';
  static const String cate = '/categories';
  static const String cart = '/cart';
  static const String addBook = '/AddBook';
  static const String category = '/category';
  static const String first = '/first';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());
        case signUpPage:
        return MaterialPageRoute(builder: (_) => SignUpPage());
        case first:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case addBook:
        return MaterialPageRoute(builder: (_) => NewAnnouncement());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyNavBar());
      case desc:
        if (args is String) {
          return MaterialPageRoute(builder: (_) => Description(bookId: args));
        }
        return _errorRoute();
      case profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case offers:
        return MaterialPageRoute(builder: (_) => Offers());
      case cate:
        return MaterialPageRoute(builder: (_) => Categories());
      case cart:
        return MaterialPageRoute(builder: (_) => Cart());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => Chat());
  }


  }
