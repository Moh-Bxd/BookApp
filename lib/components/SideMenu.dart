import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(93, 39, 178, 1),
                        Color.fromRGBO(150, 120, 196, 0.54)
                      ],
                    )),
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      "assets/BooksSideMenu.png",
                      fit: BoxFit.fill,
                    )),
              ),
              Positioned(
                  top: 35,
                  left: 28,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset("assets/ProfileSmalPic.png"),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Barney Stinson",
                            style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "stinson@esi-sba.dz",
                            style: GoogleFonts.lato(fontSize: 10,color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                ListTile(

                  leading: const Icon(Icons.settings_outlined,color: Colors.black,),
                  title: Text("Settings",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(Icons.local_offer_outlined,color: Colors.black,),
                  title: Text("Offers",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(CupertinoIcons.heart,color: Colors.black,),
                  title: Text("Favorites",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(Icons.messenger_outline,color: Colors.black,),
                  title: Text("Messages ",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(Icons.location_on_outlined,color: Colors.black,),
                  title: Text("Location",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                const Divider(color: Color(0xffC0C0C0),thickness: 0.5,),
                ListTile(

                  leading: const Icon(CupertinoIcons.paperclip,color: Colors.black,),
                  title: Text("Terms of use",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(Icons.help_outline,color: Colors.black,),
                  title: Text("Help",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),
                ListTile(

                  leading: const Icon(FontAwesomeIcons.fireExtinguisher,color: Colors.black,),
                  title: Text("Exit",style: GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                ),




              ],

            ),
          )
        ],
      ),
    );
  }
}
