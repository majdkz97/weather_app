import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FlareActor('assets/splash_screen.flr',animation: 'start',fit: BoxFit.cover,callback: (value){
         Navigator.pushReplacementNamed(context,Router.homeRoute);
       },),
    );
  }
}
