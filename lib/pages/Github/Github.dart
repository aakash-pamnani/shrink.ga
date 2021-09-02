import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubPage extends StatelessWidget {
  static String githubUrl = "http://github.com/aakashpsindhi";
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration()).then((value) {
      launchUrl(githubUrl, context);
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> launchUrl(String? url, context) async {
    bool canRedirect = await canLaunch(url!);
    print(canRedirect);
    if (canRedirect) {
      await launch(url, headers: {"target": "_self"});
      Navigator.pop(context);
    }
  }
}
