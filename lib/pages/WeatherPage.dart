import 'package:flutter/material.dart';
import 'package:weatherapp/routes.dart';
class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              print('Pop Route: ${Router.weatherRoute}');
              print('Current Route: ${Router.homeRoute}');
              },
            child: Text('Weather Screen')),
      ),
    );
  }
}
