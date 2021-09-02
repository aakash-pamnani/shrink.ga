import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/widgets/Desktop/NavBar.dart';

class AboutMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarSmall("About"),
        Body(),
      ],
    );
  }
}

class AboutDesktopPage extends StatelessWidget {
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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("About",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(
          height: 100,
        ),
        Text(
          "This is a basic Flutter App to short long url \n You can get the source code from github \n \n Made By Aakash P",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
