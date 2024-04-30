import 'dart:async';
import 'package:flutter/material.dart';

import '../components/Button.dart';
import '../routes/RouteGenerator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String text1 = "Browse the Shelves of Our Virtual Store";
    String text2 = "Books, Anywhere and Everywhere";
    String text3 = "Your On-Demand Bookshop";
    String description1 = "Get lost in our endless collection of books, from bestsellers to hidden gems";
    String description2 = "The world of books is just a few clicks away, wherever you are";
    String description3 = "Discover a world of books, buy or trade to build your personal library";

    return Scaffold(
      backgroundColor: Color(0xFFA7A9AC),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                String text="";
                String description;
                if (index == 0) {
                  text = text1;
                  description = description1;
                } else if (index == 1) {
                  text = text2;
                  description = description2;
                } else {
                  text = text3;
                  description = description3;
                }
                return OnboardingPage(
                  image: 'assets/image${index + 1}.png',
                  text: text,
                  description: description,

                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildDots(),
            ),
          ),
          
          GestureDetector(child: LoginButton(showText: "Agree And Continue", borderRadius: 8, height: 45, width: 300),
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteGenerator.signInPage,
            );
          },),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < 3; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == i ? Color(0xFF5A22AE) : Color(0xFF828282),
            ),
          ),
        ),
      );
    }
    return dots;
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.text, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFA7A9AC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff0E0E0E),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff828282),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}











