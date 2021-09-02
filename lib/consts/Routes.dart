import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/pages/404/404.dart';
import 'package:urlshortner_flutter/pages/AboutPage/About.dart';
import 'package:urlshortner_flutter/pages/ApiPage/Api.dart';
import 'package:urlshortner_flutter/pages/Github/Github.dart';
import 'package:urlshortner_flutter/pages/HomePage/HomePage.dart';
import 'package:urlshortner_flutter/pages/ResponsiveLayoutHelper.dart';

class Routes {
  static String homeRoute = "/home";
  static String aboutRoute = "/about";
  static String apiRoute = "/api";
  static String githubRoute = "/github";
  static String pageNotFoundRoute = "/404";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      homeRoute: (context) => ResponsiveLayout(
            desktop: const DesktopHomePage(),
            mobile: const MobileHomePage(),
          ),
      "/": (context) => ResponsiveLayout(
            desktop: DesktopHomePage(),
            mobile: MobileHomePage(),
          ),
      apiRoute: (context) => ResponsiveLayout(
            desktop: ApiDesktop(),
            mobile: ApiMobile(),
          ),
      aboutRoute: (context) => ResponsiveLayout(
            desktop: AboutDesktopPage(),
            mobile: AboutMobilePage(),
          ),
      githubRoute: (context) => GithubPage(),
      pageNotFoundRoute: (context) => ResponsiveLayout(
            desktop: PageNotFoundDesktop(),
            mobile: PageNotFoundMobile(),
          ),
    };
  }
}
