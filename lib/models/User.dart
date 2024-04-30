import 'Book.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String resetLink;
  final String address;
  final String profilePic;
  final List<CartItem> cart;
  final List<Book> favorites;
  final String bio;
  final String gender;
  final String phone;
  final List<String> books;
  final List<String> chats;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.resetLink,
    required this.address,
    required this.profilePic,
    required this.cart,
    required this.favorites,
    required this.bio,
    required this.gender,
    required this.phone,
    required this.books,
    required this.chats,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final List<dynamic> cartJson = json['cart'] ?? [];
    final List<dynamic> favoritesJson = json['favorites'] ?? [];
    final List<dynamic> booksJson = json['books'] ?? [];
    final List<dynamic> chatsJson = json['chats'] ?? [];

    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      resetLink: json['resetLink'],
      address: json['address'],
      profilePic: json['profilePic'],
      cart: cartJson.map((item) => CartItem.fromJson(item)).toList(),
      favorites: favoritesJson.map((item) => Book.fromJson(item)).toList(),
      bio: json['bio'],
      gender: json['gender'],
      phone: json['phone'],
      books: booksJson.map((item) => item.toString()).toList(),
      chats: chatsJson.map((item) => item.toString()).toList(),
    );
  }
}

class CartItem {
  final Book book;
  final int quantity;

  CartItem({required this.book, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      book: Book.fromJson(json['book']),
      quantity: json['quantity'],
    );
  }
}