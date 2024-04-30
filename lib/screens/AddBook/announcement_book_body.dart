import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../components/Button.dart';
import '../../components/imput_field.dart';
import '../../models/host.dart';
import '../../texts/announcement_text.dart';

class AnnouncementBody extends StatefulWidget {
  AnnouncementBody({super.key});

  @override
  State<AnnouncementBody> createState() => _AnnouncementBodyState();
}

class _AnnouncementBodyState extends State<AnnouncementBody> {
  //The variable used in this class
  final bookNameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  var value1;
  var value2;
  final String sellingTypeHint = "What do you accept?";
  var rating;
  File? image;

//Lists used in the class
  final List<String> sellingType = ["Trade", "Payment"];
  final List<String> categories = [
    "Non-fiction",
    "Classics",
    "Fantasy",
    "Young Adult",
    "Crime",
    "Horror",
    "Sci-fi",
    "Drama",
    "Romance",
    "Business"
  ];

//functions used in the class

  Future<void> addBook() async {
    try {
      // API endpoint URL
      const String apiUrl = 'http://192.168.37.1":3111/user/add-book';

      // Request body data
      Map<String, dynamic> requestBody = {
        'name': "aymen",
        'author': "aymen",
        'price': 9,
        'category': "Drama",
        'state': 2,
        'quantity': 4,
        'typeSelling': "Trade",
        'description': "aymen",
        'userName': "jamal",
        'email': "a@gmail.com",
        'phone': "0112528578",
        'city': "blida",
        'region': "blida",
        'gender': "Male",
        'address': "france",
      };

      // Create a File object for the image file
      File? imageFile = image;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("authToken");
      print(token);
      if (imageFile == null) {
        print('Image file is null$token');
        return;
      }

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      print("1");

      // Set headers
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] =
          'Bearer $token'; // Replace with your actual token
      print("2");

      // Attach fields
      request.fields['data'] = jsonEncode(requestBody);
      print("3");

      // Attach image file
      var fileStream = http.ByteStream(imageFile.openRead());
      var fileLength = await imageFile.length();
      print("4");

      var multipartFile = http.MultipartFile(
        'photo',
        fileStream,
        fileLength,
        filename: imageFile.path.split('/').last,
      );
      print("5");

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Get response body as a string
      var responseString = await response.stream.bytesToString();
      print("6");

      // Check response status code
      if (response.statusCode == 200) {
        // Book successfully added
        print('Book added successfully');
      } else {
        // Handle error response
        print('Failed to add book. Error: ${response.statusCode}');
        print(responseString);
      }
    } catch (e) {
      // Handle network or API call exception
      print('Exception occurred: $e');
    }
  }
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }


  DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),

            const AnnouncementText(text: "Book details"),
            SizedBox(
              height: 35,
            ),

            //adding the book image
            image != null
                ? Image.file(
                    File(image!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Image(image: AssetImage('assets/addphoto.png')),

            //add book button
            TextButton(
                onPressed: () => pickImage(),
                child: Text(
                  'upload book image',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 15,
                  ),
                )),

            const AnnouncementText(text: "Book name"),
            //book name input field
            SizedBox(
                height: 70,
                child: ImputField(
                    obsecureText: false,
                    controller: bookNameController,
                    hintText: "What is your book's name",
                    keyboardInputType: TextInputType.text)),

            const AnnouncementText(text: "Selling Type"),

            //Selling type dropwon list
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  items: sellingType.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value1 = value),
                  value: value1,
                  isExpanded: true,
                  hint: Text('   What do you accept'),
                ))),
            //category text
            const AnnouncementText(text: "Category"),
            //categories drop down list
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  items: categories.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value2 = value),
                  value: value2,
                  isExpanded: true,
                  hint: Text('   Which category?'),
                ))),

            const AnnouncementText(text: "State"),

            //Rating stars**********************************************************
            Padding(
              padding: EdgeInsets.fromLTRB(25, 15, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                      itemSize: 30,
                      minRating: 1,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Color(0xff9102D3)),
                      onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          })),
                ],
              ),
            ),

            const AnnouncementText(text: "Price"),
            //The Price input field
            SizedBox(
                height: 65,
                child: ImputField(
                    obsecureText: false,
                    controller: priceController,
                    hintText: "What is your price",
                    keyboardInputType: TextInputType.text)),

            const AnnouncementText(text: "Description"),

            //Description big white input
            Container(
                height: 150,
                child: ImputField(
                    obsecureText: false,
                    controller: descriptionController,
                    hintText: "",
                    keyboardInputType: TextInputType.text)),
            //Next button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    if (image != null) {
                      print("dadddddddddddddy");
                      addBook();
                      print("yoooooooo"); // Call `addBook` function
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 60),
                      width: 132,
                      height: 30,
                      child: LoginButton(
                        showText: "Next ",
                        borderRadius: 4,
                        height: 30,
                        width: 130,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
