import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;
  ResponsiveLayout({required this.desktop, required this.mobile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return desktop;
        } else {
          return mobile;
        }
      }),
    );
  }
}
