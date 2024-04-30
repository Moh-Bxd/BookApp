import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/Cart illustartion.svg",
            )),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Your Cart is Empty!",
            style: emptyTextBig,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Looks like you haven’t added anything to your cart yet, Explore more Books!",
            style: emptyTextSmall,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
