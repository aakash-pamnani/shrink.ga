import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/widgets/Desktop/NavBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urlshortner_flutter/consts/Size.dart';

class PageNotFoundDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarLarge(),
        Body(),
      ],
    );
  }
}

class PageNotFoundMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarSmall("Page Not Found"),
        Body(),
      ],
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = Size.getWidth(context);
    double height = Size.getHeight(context);
    return Column(
      children: [
        SizedBox(
            width: width * 0.5,
            height: height * 0.5,
            child: SvgPicture.asset(
              "notfound.svg",
            ))
      ],
    );
  }
}
