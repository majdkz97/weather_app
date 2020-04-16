import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/hourly_forecast.dart';
import 'package:weatherapp/widgets/weather_page/weather_now/weather_condition_flare.dart';

import '../../animator.dart';

class WeatherHourlyItem extends StatelessWidget {
  final HourlyForecast hourlyForecast;

  const WeatherHourlyItem({Key key, this.hourlyForecast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        weatherConditionFlare(
            icon: hourlyForecast.icon
        ),
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: WidgetAnimator(
              fromLeft: true,  fromTop: true,delay: 200,time: 400
              ,child: Text('${DateFormat.j().format(hourlyForecast.dateTime)}')),
        ),
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: WidgetAnimator(
            fromLeft: true,  fromTop: true,delay: 200,time: 400,
            child: Text('${hourlyForecast.temperature}°',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ),
        ),


      ],
    );
  }
}
