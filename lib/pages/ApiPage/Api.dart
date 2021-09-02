import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/widgets/Desktop/NavBar.dart';

class ApiMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBarSmall("Api"),
          ],
        ),
      ),
    );
  }
}

class ApiDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBarLarge(),
          ],
        ),
      ),
    );
  }
}
