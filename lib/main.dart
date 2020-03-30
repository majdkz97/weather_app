import 'package:flutter/material.dart';
import 'package:weatherapp/routes.dart';

import 'pages/SplashScreen.dart';

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
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),

      home: SplashScreen(),
    );
  }
}
