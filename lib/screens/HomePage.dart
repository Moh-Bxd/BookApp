import 'dart:math';

import 'package:cpi_project/components/Chips.dart';
import 'package:cpi_project/components/SearchBar.dart';
import 'package:cpi_project/components/buton.dart';
import 'package:cpi_project/data/BookProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/BestDealsCard.dart';
import '../components/Card.dart';
import 'package:cpi_project/screens/Description.dart';

import '../components/MyNavBar.dart';
import '../components/SideMenu.dart';
import '../models/Book.dart';
import '../Constants.dart';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../routes/RouteGenerator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int i = 0;
  late BookProvider bookProvider;
  Book bookm = Book(name: "Tuesday Monday", category: "Novel", author: "Adolf Hitler", price: 600 ,
      image: 'assets/book_cover.png', forTrade: true, id: '1', dateUploaded: DateTime.now(),description: "",state: 3,user: "s", typeSelling: 'Trade');

  @override
  void initState() {
    super.initState();
    bookProvider = Provider.of<BookProvider>(context, listen: false);
    context.read<BookProvider>().fetchBooks();
    context.read<BookProvider>().searchBooksByCategory(chips[0]);

  }
  PageController pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  int current = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  // late PageController pageController ;
  @override
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => bookProvider,
          child: Scaffold(

      key: _key,
      drawer: const SideMenu(),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              floating: true,
              snap: true,
              expandedHeight: 175,
              backgroundColor: appbarColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  shadow,
                                ],
                              ),
                              child: IconButton(
                                  onPressed: () =>
                                  _key.currentState!.openDrawer(),
                                  icon: const Icon(
                                    CupertinoIcons.bars,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [shadow]),
                              child: IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                    CupertinoIcons.bell,
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          color: appbarColor,
                          child: SearchBar(searchController: _searchController),
                        )
                      ],
                    ),
                  )),
            ),
            SliverToBoxAdapter(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Best Deals
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Text(
                    "Best Deals",
                    style: mainText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: ChangeNotifierProvider<BookProvider>(
                    create: (context) => bookProvider,
                    child: Consumer<BookProvider>(
                      builder: (context, bookProvider, child) {
                        if (bookProvider.latestBooks.isEmpty) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                bookProvider.fetchBooks();
                              },
                              child: LoginButton(
                                showText: "Try again",
                                borderRadius: 10,
                                height: 40,
                                width: 200,
                              ),
                            ),
                          );
                        } else {
                          return PageView.builder(
                            controller: pageController,
                            itemCount: bookProvider.latestBooks.length,
                            itemBuilder: (context, index) {
                              if (bookProvider.latestBooks.isEmpty) {
                                return CircularProgressIndicator();
                              } else {
                                Book book = bookProvider.latestBooks[index];
                                print(book.description);
                                return GestureDetector(
                                  child: BestDealsCard(book: book),
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Description(bookId: book.id)));
                                  },
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  )
                  ),
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) {
                  //    i =index;
                  //     return BestDealsCard(
                  //       book: book,
                  //     );
                  //   },
                  // ),

                LayoutBuilder(
                  builder: (p0, p1) {
                  return Container(
                    width: p1.maxWidth,
                    height: 20,
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      effect: const WormEffect(
                          activeDotColor: ourpurple,
                          dotColor: Colors.white,
                          dotHeight: 9,
                          dotWidth: 9,
                          spacing: 10),
                      controller: pageController,
                      count: 5,
                    ),
                  );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories", style: mainText),
                      TextButton(
                          onPressed: () {
                            final books = bookProvider.booksByCategory;
                            Navigator.pushReplacementNamed(
                              context,
                              RouteGenerator.cate,
                              arguments: books
                            );
                          },
                          child: Text("Show All",
                              style: GoogleFonts.roboto(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // the tab
                Padding(
                  padding:  const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Consumer<BookProvider>(
                      builder: (context, bookProvider, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chips.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                  final selectedCategory =chips[index];
                                  bookProvider.searchBooksByCategory(selectedCategory);

                                });
                              },
                              child: Chips(
                                index: index,
                                current: current,
                                chip: chips[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Trending
                SizedBox(
                  height: 270,
                  width: double.infinity,
                  child: Consumer<BookProvider>(
                    builder: (context, bookProvider, child) {
                      final books = bookProvider.booksByCategory;
                      if (books.isEmpty){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else {return  ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteGenerator.desc,
                                    arguments: book.id
                                  );

                                },
                                child: Cards(book: book));
                          }) ;}

                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ],
      ),
    ),
        ));
  }
}
