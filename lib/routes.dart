import 'package:flutter/material.dart';
import 'package:weatherapp/pages/HomePage.dart';
import 'package:weatherapp/pages/SplashScreen.dart';

import 'pages/WeatherPage.dart';

class Router {
  static const String homeRoute = '/';
  static const String splashScreenRoute = '/splash_screen';
  static const String weatherRoute = '/weather';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case weatherRoute:
        return MaterialPageRoute(builder: (_) => WeatherPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
