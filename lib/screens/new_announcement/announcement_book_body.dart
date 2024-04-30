



import 'dart:convert';
import 'dart:io';

import 'package:cpi_project/models/host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Button.dart';
import '../../components/imput_field.dart';
import '../../models/category.dart';
import '../../texts/announcement_text.dart';

class AnnouncementBody extends StatefulWidget {
  AnnouncementBody({Key? key});

  @override
  State<AnnouncementBody> createState() => _AnnouncementBodyState();
}

class _AnnouncementBodyState extends State<AnnouncementBody> {
  final bookNameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  var value1;
  var value2;
  final String sellingTypeHint = "What do you accept?";
  var rating;
  File? image;

  final List<String> sellingType = ["Trade", "Payment"];

  // Future<void> addBook() async {
  //   try {
  //     const String apiUrl = 'http://$host:3111/user/add-book';
  //     final httpClient = http.Client();
  //
  //     Map<String, dynamic> requestBody = {
  //       'name': bookNameController.text,
  //       'author': 'Book Author',
  //       'price': priceController.text,
  //       'category': 'Fiction',
  //       'state': 'New',
  //       'quantity': 1,
  //       'typeSelling': 'Payment',
  //       'description': descriptionController.text,
  //       'contactName': 'fenjdksn;',
  //       'email': 'fbjezds,v',
  //       'phone': 'fezdjbsv',
  //       'city': ' fsdfe',
  //       'region': 'msila',
  //       'gender': 'helicopter',
  //       'address': '123 Main St',
  //     };
  //
  //     final response = await httpClient.post(
  //       Uri.parse(apiUrl),
  //       body: jsonEncode(requestBody),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print('Book added successfully');
  //     } else {
  //       print('Failed to add book. Error: ${response.statusCode}');
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print('Exception occurred: $e');
  //   }
  // }
  Future<void> addBook() async {
    try {
      // API endpoint URL
       const String apiUrl = 'http://$host:3111/user/add-book';

      // Request body data
      Map<String, dynamic> requestBody = {
        'name': "ayomic habits",
        'author': "john",
        'price': 25,
        'category': "Drama",
        'state': 3,
        'quantity': 4,
        'typeSelling': "Trade",
        'description': "best seller book",
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
        print('Image file is null');
        return;
      }

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Set headers
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token'; // Replace with your actual token

      // Attach fields
      request.fields['data'] = jsonEncode(requestBody);

      // Attach image file
      var fileStream = http.ByteStream(imageFile.openRead());
      var fileLength = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'photo',
        fileStream,
        fileLength,
        filename: imageFile.path.split('/').last,
      );

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Get response body as a string
      var responseString = await response.stream.bytesToString();

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
    return Material(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 35,),
              const AnnouncementText(text: "Book details"),
              const SizedBox(height: 35,),
              image != null
                  ? Image.file(File(image!.path), width: 100, height: 100, fit: BoxFit.cover,)
                  : const Image(image: AssetImage('assets/addphoto.png')),
              TextButton(
                onPressed: () => pickImage(),
                child: const Text(
                  'upload book image',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 15,
                  ),
                ),
              ),
              const AnnouncementText(text: "Book name"),
              SizedBox(
                height: 70,
                child: ImputField(
                  obsecureText: false,
                  controller: bookNameController,
                  hintText: "What is your book's name",
                  keyboardInputType: TextInputType.text,
                ),
              ),
              const AnnouncementText(text: "Selling Type"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
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
                    hint: const Text('   What do you accept'),
                  ),
                ),
              ),
              const AnnouncementText(text: "Category"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: chips.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value2 = value),
                    value: value2,
                    isExpanded: true,
                    hint: const Text('   Which category?'),
                  ),
                ),
              ),
              const AnnouncementText(text: "State"),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      itemSize: 30,
                      minRating: 1,
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Color(0xff9102D3)),
                      onRatingUpdate: (rating) => setState(() {
                        this.rating = rating;
                      }),
                    ),
                  ],
                ),
              ),
              const AnnouncementText(text: "Price"),
              SizedBox(
                height: 65,
                child: ImputField(
                  obsecureText: false,
                  controller: priceController,
                  hintText: "What is your price",
                  keyboardInputType: TextInputType.text,
                ),
              ),
              const AnnouncementText(text: "Description"),
              SizedBox(
                height: 150,
                child: ImputField(
                  obsecureText: false,
                  controller: descriptionController,
                  hintText: "",
                  keyboardInputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        addBook();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 60),
                        width: 132,
                        height: 30,
                        child: const LoginButton(showText: "Next ", borderRadius: 4, height: 30, width: 130),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
