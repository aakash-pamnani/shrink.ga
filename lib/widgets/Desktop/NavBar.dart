import 'package:flutter/material.dart';

class NavBar {
  static List<Widget> getNavItems() {
    return [
      NavItem("Home", "/home"),
      NavItem("About", "/about"),
      // NavItem("Api", "/api"),
      NavItem("Github", "/github"),
    ];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constrains) {
  //       if (constrains.maxWidth > 800) {
  //         return NavBarLarge();
  //       } else {
  //         return NavBarSmall();
  //       }
  //     },
  //   );
  // }
}

class NavBarSmall extends StatelessWidget {
  NavBarSmall(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}

class NavBarLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: NavBar.getNavItems(),
          // TODO implement login feature
          // Spacer(),
          // MaterialButton(
          //   onPressed: () {},
          //   child: Text("Login/Signup"),
          //   padding: EdgeInsets.all(20.0),
          //   textColor: Colors.white,
          //   color: Colors.orange,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(7)),
          //   highlightColor: Colors.orange,
          //   elevation: 10,
          //   hoverElevation: 10,
          //   mouseCursor: MouseCursor.uncontrolled,
          // )
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String name, route;
  NavItem(this.name, this.route);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          child: Text(name, style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.pushNamed(
              context,
              route,
            );
          },
        ),
      ),
    );
  }
}
