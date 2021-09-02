import 'package:flutter/material.dart';
import 'package:urlshortner_flutter/consts/GenerateUrl.dart';
import 'package:url_launcher/url_launcher.dart';


class Redirector extends StatelessWidget {
  Redirector({required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkUrl(url),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString() == "404") {
              print("has 404");
              Future.delayed(Duration()).then(
                  (value) => Navigator.pushReplacementNamed(context, "/404"));
            } else {
              print("no 404");
              launchUrl(snapshot.data as String, context);
            }

            // Navigator.pop(context);
            return Container();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  static checkUrl(String url) async {
    print(url);
    String? response;
    if (checkIfCustomUrlExists(url.substring(0))) {
      response = await GenerateUrl.getLongUrl(url.substring(0));
    } else {
      response = "404";
    }

    return response ?? "404";
  }

  static bool checkIfCustomUrlExists(String? customUrl) {
    bool exists = true;
    GenerateUrl.ifCustomUrlAlreadyExists(customUrl ?? "").then((value) {
      exists = value;
    });
    return exists;
  }

  Future<void> launchUrl(String? url, context) async {
    print("Url is " + url!);
    bool canRedirect = await canLaunch(url);
    print(canRedirect);
    if (canRedirect) {
      await launch(url);
      Navigator.pop(context);
    }
  }
}
