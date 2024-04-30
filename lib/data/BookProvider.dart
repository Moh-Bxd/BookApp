import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/Book.dart';
import '../models/Contactinfo.dart';
import '../models/host.dart';

class BookProvider with ChangeNotifier {
  // this is to fetch the book details
  Book? book;
  // Future<void> fetchBookDetails(String bookId) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString("authToken");
  //       print(token);
  //     if (token == null) {
  //       // not signed in
  //       // never happen
  //       return;
  //     }
  //     final response = await http.get(
  //       Uri.parse('http://$host:3111/books/$bookId'),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final bookData = json.decode(response.body) as Map<String, dynamic>;
  //       print(bookData);
  //       print("--------------------------");
  //
  //       try {
  //         book = Book(
  //           forTrade: bookData['typeSelling'] == "Trade" ? true : false,
  //           id: bookData['_id'],
  //           name: bookData['name'],
  //           author: bookData['author'],
  //           price: bookData['price'].toDouble(),
  //           category: bookData['category'],
  //           image: bookData['image'],
  //           dateUploaded: DateTime.parse(bookData['dateUploaded']).toLocal(),
  //           state: bookData['state'],
  //           typeSelling: bookData['typeSelling'],
  //           description: bookData['description'],
  //           contactInfo: bookData['contactInfo'],
  //           user: bookData['user'],
  //         );
  //       } catch (e) {
  //         // Handle any parsing errors
  //         print('Error parsing book data: $e');
  //         book = null; // or provide a default value
  //       }
  //
  //       notifyListeners();
  //     } else {
  //       throw Exception('Failed to fetch book details');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future<void> fetchBookDetails(String bookId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");
      print(token);

      if (token == null) {
        // not signed in
        // never happen
        return;
      }

      final response = await http.get(
        Uri.parse('http://$host:3111/books/$bookId'),
      );

      if (response.statusCode == 200) {
        final bookData = json.decode(response.body) as Map<String, dynamic>;


        try {
           book = Book(
            forTrade: bookData['typeSelling'] == "Trade",
            id: bookData['_id'],
            name: bookData['name'],
            author: bookData['author'],
            price: bookData['price'].toDouble(),
            category: bookData['category'],
            image: bookData['image'],
            dateUploaded: DateTime.parse(bookData['dateUploaded']).toLocal(),
            state: bookData['state'],
            typeSelling: bookData['typeSelling'],
            description: bookData['description'],
            contactInfo: ContactInfo.fromJson(bookData['contactInfo']),
            user: bookData['user'],
          );
          notifyListeners();

          // Use the fetched book object here
          print(book?.state);
          print(book?.name);


        } catch (e) {
          // Handle any parsing errors
          print('Error parsing book data: $e');
        }
      } else {
        throw Exception('Failed to fetch book details');
      }
    } catch (e) {
      print(e);
    }
  }



  // this one is to fetch the latest 8 books
  List<Book> latestBooks = [];
  Future<void> fetchBooks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");
      print("yaaaaaaw -======tt======= $token");

      if (token == null) {
        print("yoo token null");
        // not signed in
        // never happen
        return;
      }

      final response = await http.get(
        Uri.parse('http://$host:3111/user/get-books'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Book> fetchedBooks = [];

        for (var bookData in data) {
          final book = Book(
            forTrade: bookData['typeSelling'] == "Trade" ? true : false,
            id: bookData['_id'],
            name: bookData['name'],
            author: bookData['author'],
            price: bookData['price'].toDouble(),
            category: bookData['category'],
            image: bookData['image'],
            dateUploaded: DateTime.parse(bookData['dateUploaded']).toLocal(),
            state: bookData['state'],
            typeSelling: bookData['typeSelling'],
            description: bookData['description'],
            user: bookData['user'],
          );

          fetchedBooks.add(book);
        }

        latestBooks = fetchedBooks;
        latestBooks.forEach((book) {
          print('Book Name: ${book.name}');
          print('Author: ${book.author}');
          print('Price: ${book.price}');
          print('Category: ${book.category}');
          // Print other properties as needed
          print('------------------------');
        });
        notifyListeners();
      } else {
        print(        response.statusCode
        );
        throw Exception('Failed to fetch books');
      }
    } catch (e) {
      print(e);
    }
  }

  List<Book> booksByCategory = [];
  Future<void> searchBooksByCategory(String category) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        // not signed in
        // never happen
        return;
      }
      final response = await http.get(
        Uri.parse('http://$host:3111/api/books/searchh/$category'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Book> fetchedBooks = [];

        for (var bookData in data) {
          final book = Book(
            id: bookData['_id'],
            name: bookData['name'],
            author: bookData['author'],
            price: bookData['price'].toDouble(),
            category: bookData['category'],
            image: bookData['image'],
            dateUploaded: DateTime.parse(bookData['dateUploaded']),
            state: bookData['state'],
            typeSelling: bookData['typeSelling'],
            description: bookData['description'],
            user: bookData['user'],
            forTrade: bookData['typeSelling'] == "Trade" ? true : false,
          );

          fetchedBooks.add(book);
        }

        booksByCategory = fetchedBooks;
        booksByCategory.forEach((book) {
          print('Book Name NYYY: ${book.name}');
          print('AuthorBYYYYYY: ${book.author}');
          print('Price: ${book.price}');
          print('Category: ${book.category}');
          // Print other properties as needed
          print('------------------------');
        });



        notifyListeners();
      } else {
        throw Exception('Failed to search books by category');
      }
    } catch (e) {
      print(e);
    }
  }
}
