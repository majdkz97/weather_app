import 'package:flutter/material.dart';
import 'package:weatherapp/repositories/api/weather/weather_api.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String text = 'Weather Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () async {
              Map<String,dynamic> result = await WeatherApi().getWeatherForecast();
              print(result);

              setState(() {
                text = result.toString();
              });

//              Navigator.pop(context);
//              print('Pop Route: ${Router.weatherRoute}');
//              print('Current Route: ${Router.homeRoute}');
              },
            child: Text(text)),
      ),
    );
  }
}
