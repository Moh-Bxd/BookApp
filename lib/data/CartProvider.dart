import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/Book.dart';
import '../models/host.dart';

class CartProvider with ChangeNotifier {
  void printBookData(Map<String, dynamic> bookData) {
    bookData.forEach((key, value) {
      print('$key: $value');
    });
    print('------------------------');
  }
  List<dynamic> cartItems = [];
  List<dynamic> offerItems = [];
  Future<void> fetchUserOffers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        print("Null token. Cannot fetch user books.");
      }

      final response = await http.get(
        Uri.parse('http://$host/user/books'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final List<Book> fetchedBooks = data.map((bookData) {
          return Book(
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
            forTrade: bookData['typeSelling'] == "Trade",
          );
        }).toList();

         offerItems=fetchedBooks;
      } else {
        print(response.statusCode);
        throw Exception('Failed to fetch user books');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> fetchUserCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        print("null token cart");
        // not signed in
        // never happen
        return;
      }
      final response = await http.get(
        Uri.parse('http://$host:3111/user/cart'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final List<Book> fetchedBooks = data.map((bookData) {
          return Book(
            id: bookData['book']['_id'],
            name: bookData['book']['name'],
            author: bookData['book']['author'],
            price: bookData['book']['price'].toDouble(),
            category: bookData['book']['category'],
            image: bookData['book']['image'],
            dateUploaded: DateTime.parse(bookData['book']['dateUploaded']).toLocal(),
            state: bookData['book']['state'],
            typeSelling: bookData['book']['typeSelling'],
            description: bookData['book']['description'],
            user: bookData['book']['user'],
            forTrade: bookData['book']['typeSelling'] == "Trade",
          );
        }).toList();

        cartItems = fetchedBooks;
        cartItems.forEach((book) {
          print('Book Name caaaaaart: ${book.name}');
          print('Author: ${book.author}');
          print('Price: ${book.price}');
          print('Category: ${book.category}');
          // Print other properties as needed
          print('------------------------');
        });

        notifyListeners();
      } else {
        print(response.statusCode);
        throw Exception('Failed to fetch user cart');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> addToCart(String bookId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        print("ddd");
        // not signed in
        // never happen
        return;
      }
      print("adding to cart");
      final response = await http.post(

        Uri.parse('http://$host:3111/api/add-to-cart'),
        headers: {
          'Authorization': 'Bearer $token',
          'id':bookId
        },
      );
      print(bookId);
      print("wwwwwwwwwwwwwwwwwww");
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Update the cart state in the provider
        print("iiiiii");
        notifyListeners();
      }
    } catch (e) {
      print("ERROR ADDING TO CART");
      // throw Exception('Failed to add to cart: $e');
    }
  }
  Future<void> addToFavorites(String bookId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        print("User not signed in");
        // Handle not signed in scenario
        return;
      }

      final response = await http.post(
        Uri.parse('http://$host:3111/api/add-to-favorites'),
        headers: {
          'Authorization': 'Bearer $token',
          'id': bookId,
        },
      );

      print(bookId);
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Handle success response
        print("Added to favorites");
      } else {
        // Handle error response
        print("Failed to add to favorites: ${response.body}");
      }
    } catch (e) {
      print("Error adding to favorites: $e");
      // Handle exception
    }
  }

  // this is to remove an item


  Future<void> removeFromCart(String itemId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");

      if (token == null) {
        print("Null token. Cannot remove item from cart.");
        return;
      }

      final response = await http.delete(
        Uri.parse('http://$host:3111/api/remove-from-cart/$itemId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Item removed successfully from the cart
        final data = json.decode(response.body);

        // Fetch the updated cart items from the response
        final List<dynamic> cartData = data['cart'];
        final List<Book> fetchedBooks = cartData.map((bookData) {
          return Book(
            id: bookData['book']['_id'],
            name: bookData['book']['name'],
            author: bookData['book']['author'],
            price: bookData['book']['price'].toDouble(),
            category: bookData['book']['category'],
            image: bookData['book']['image'],
            dateUploaded: DateTime.parse(bookData['book']['dateUploaded']).toLocal(),
            state: bookData['book']['state'],
            typeSelling: bookData['book']['typeSelling'],
            description: bookData['book']['description'],
            user: bookData['book']['user'],
            forTrade: bookData['book']['typeSelling'] == "Trade",
          );
        }).toList();

        // Update the cart items in the Flutter app's state
        cartItems = fetchedBooks;

        // Notify listeners to update the UI
        notifyListeners();
      } else {
        // Failed to remove item from cart
        throw Exception('Failed to remove item from cart');
      }
    } catch (e) {
      print(e);
    }
  }}