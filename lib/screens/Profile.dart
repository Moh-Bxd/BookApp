import 'package:cpi_project/components/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import '../components/Card.dart';
import '../components/CurveClipper.dart';
import '../components/MyNavBar.dart';
import '../models/Book.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Book book = Book(name: "Tuesday Monday", category: "Novel", author: "Adolf Hitler", price: 600 ,
        image: 'assets/book_cover.png', forTrade: true, id: '1',dateUploaded: DateTime.now(),description: "",state: 3,user: "s", typeSelling: 'Trade');
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {

      },backgroundColor: ourpurple,child: Icon(CupertinoIcons.add,color: Colors.white,)),
      extendBody: true,
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            leading: const IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: null,),
            title: const Text("My profile",style: TextStyle(fontSize: 16,color: Colors.black),),
            titleSpacing: 2,
            backgroundColor: Colors.transparent,
            pinned: true,
            floating: true,
            snap: true,
            elevation: 0,
            expandedHeight: 350,
          collapsedHeight: 60,

          flexibleSpace: FlexibleSpaceBar(

            collapseMode: CollapseMode.parallax,
            background: Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Text("Rebiai Mohamed",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),textAlign:TextAlign.center)),
                Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on,size: 16 ,),
                        Text("M\'sila",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300),textAlign:TextAlign.center),
                      ],
                    )),
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(127, 76, 208, 1.0),
                            Color.fromRGBO(150, 120, 196, 0.54)
                          ],
                        )
                    ),

                    height: 200.0,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 130,

                  child: Container(
                    alignment: Alignment.center,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                  child: const CircleAvatar(


                    radius: 60,
                    backgroundImage: ExactAssetImage("assets/profileImage.jpg",),
                  ),
                ),)
              ],
                          )
          ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: const [
                          Text("100",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                          SizedBox(height: 4,),
                          Text("likes",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w300 ,color: ourpurple),)
                        ],
                      ),
                      const SizedBox(width: 8,),
                      Column(
                        children: const [
                          Text("3",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                          SizedBox(height: 4,),
                          Text("sold",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w300 ,color: ourpurple),)
                        ],
                      ),
                      const SizedBox(width: 8,),

                      Column(
                        children: const [
                          Text("5",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
                          SizedBox(height: 4,),
                          Text("upload",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w300,color: ourpurple ),)

                        ],

                      ),


                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text("Posts",style: mainText,),
                      ),
                      const SizedBox(width: 20,),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: LoginButton(showText: "Contact", borderRadius: 15, height: 40, width: 130),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: ListView.builder(
                          itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Cards(book: book);
                        }),
                  ),







                ],
              ),
            )

          )
        ],

      ),

    ));
  }
}
