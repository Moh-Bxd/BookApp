import 'package:cpi_project/components/SearchBar.dart';
import 'package:cpi_project/models/category.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../components/Command.dart';
import '../components/MyNavBar.dart';
import '../data/BookProvider.dart';
import '../models/Book.dart';

class SingleCategory extends StatefulWidget {
  final String category;

  const SingleCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}
class _SingleCategoryState extends State<SingleCategory> {
  final Book book = Book(
    name: "Tuesday Monday",
    category: "Novel",
    author: "Adolf Hitler",
    price: 600,
    image: 'assets/book_cover.png',
    forTrade: true,
    id: '1',
    dateUploaded: DateTime.now(),
    description: "",
    state: 3,
    user: "s",
    typeSelling: 'Trade',
  );
  late BookProvider bookProvider;
  @override
  void initState() {
    super.initState();
    bookProvider = Provider.of<BookProvider>(context, listen: false);
    context.read<BookProvider>().searchBooksByCategory(widget.category);

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => bookProvider,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: const Text(
              "Category",
              style: titleAppBar,
            ),
            centerTitle: true,
            backgroundColor: appbarColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            leading: IconButton(
              color: Colors.black,
              icon: LineIcon.arrowLeft(),
              onPressed: () {},
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top :10,left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 14,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Consumer<BookProvider>(builder: (context, value, child) {
                        return GestureDetector(
                            onTap: () {

                            },
                            child: Command(book: book,delete: false,));
                      },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
