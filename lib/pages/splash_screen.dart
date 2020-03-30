import 'package:flutter/material.dart';
import 'package:weatherapp/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context,Router.homeRoute);
            },
            child: Text('Splash Screen')),
      ),
    );
  }
}
