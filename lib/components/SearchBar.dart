import 'package:flutter/material.dart';

import '../Constants.dart';

class SearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  SearchBar({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tradeAndSell = ["Trade", "sell"];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: const [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff252525),
            ),
            hintText: "Search Tilte/Author",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10.0)),
      ),
    );
  }
}
