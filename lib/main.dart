import 'package:flutter/material.dart';
import 'package:weatherapp/routes.dart';
import 'package:weatherapp/themes/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.splashScreenRoute,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,

      //home: SplashScreen(),
    );
  }
}
