
import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/widgets/Desktop/NavBar.dart';
import 'package:urlshortner_flutter/widgets/Desktop/UrlForm.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBarLarge(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class MobileHomePage extends StatelessWidget {
  const MobileHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBarSmall("Home"),
            Body(),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: NavBar.getNavItems(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "URL Shortener",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 70,
              ),
              UrlForm(),
            ]));
  }
}
