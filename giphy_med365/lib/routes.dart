import 'package:flutter/material.dart';
import 'package:giphy_med365/modules/home/home_module.dart';
import 'package:giphy_med365/modules/splash/splash_page.dart';
import 'package:giphy_med365/shared/pages/gif_page.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => SplashPage(),
      );
    case '/home':
      return MaterialPageRoute(
        builder: (_) => HomeModule(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
              child: TextResponsive('No route defined for ${settings.name}')),
        ),
      );
  }
}
