import 'package:cpi_project/components/Command.dart';
import 'package:cpi_project/Constants.dart';
import 'package:cpi_project/components/Empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../components/BestDealsCard.dart';
import '../components/MyNavBar.dart';
import '../data/CartProvider.dart';
import '../models/Book.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  late CartProvider cartProvider;

  void initState() async{
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchUserCart();
  }
  @override
  Widget build(BuildContext context) {

    Book book = Book(
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
        typeSelling: 'Trade');
    bool commandEmpty = true;


    return SafeArea(
      child: ChangeNotifierProvider<CartProvider>.value(
        value: cartProvider,
        child: Scaffold(

          extendBody: true,
          appBar: AppBar(
            title: const Text(
              "My Offers",
              style: titleAppBar,
            ),
            centerTitle: true,
            backgroundColor: appbarColor,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            leading: IconButton(
              color: Colors.black,
              icon: LineIcon.arrowLeft(),
              onPressed: () {},
            ),
          ),
          backgroundColor: backgroundColor,
          body: Padding(
              padding: const EdgeInsets.all(25),
              child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  if (cartProvider.offerItems.isEmpty) {
                    return Empty();
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "For Sale ",
                            style: mainText,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cartProvider.offerItems.length,
                              itemBuilder: (context, index) {
                                return Command(
                                    book: cartProvider.offerItems[index], delete: true,);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              )),
        ),
      ),
    );
  }
}
//Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Spacer(
//                         flex: 2,
//                       ),
//                       Container(
//                           alignment: Alignment.center,
//                           child: SvgPicture.asset(
//                             "assets/Cart illustartion.svg",
//                           )),
//                       const Spacer(
//                         flex: 1,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           "You have no offers to show!",
//                           style: emptyTextBig,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       const Spacer(flex: 1),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           "Looks like you haven’t put anything for sale, Add a new one!",
//                           style: emptyTextSmall,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       const Spacer(
//                         flex: 3,
//                       ),
//                     ],
//                   )
