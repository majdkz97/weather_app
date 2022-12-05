import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/themes/app_theme.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FlareActor('assets/splash_screen.flr',
         animation: DataHelper.selectedTheme==AppThemes.darkMode?'dark':'light',
         fit: BoxFit.cover,callback: (value){
         Navigator.pushReplacementNamed(context,AppRouter.homeRoute);
       },),
    );
  }
}
