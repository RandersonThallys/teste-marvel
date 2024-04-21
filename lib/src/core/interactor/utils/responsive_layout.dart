import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;

  final Widget desktop;
  const ResponsiveLayout({
    super.key,
    required this.desktop,
    required this.mobile,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 360;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 720) {
        return desktop;
      } else {
        return mobile;
      }
    });
  }
}
