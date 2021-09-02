import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/pages/RedirectPage.dart/Redirector.dart';

import 'consts/Routes.dart';

void main() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {}

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoutes(),
        onGenerateRoute: (settings) {
          String url = settings.name ?? "";
          return MaterialPageRoute(builder: (context) {
            return Redirector(url: url);
          });
        },
        onUnknownRoute: (settings) {
          print("unknown");
        });
  }
}
