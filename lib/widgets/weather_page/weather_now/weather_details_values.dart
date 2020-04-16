import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/helpers/screen.dart';
import 'package:weatherapp/models/hourly_forecast.dart';
import 'package:weatherapp/widgets/animator.dart';

import 'weather_property.dart';
import 'weather_temperature.dart';

class WeatherDetailsValues extends StatelessWidget {
  final HourlyForecast hourlyForecast;

  const WeatherDetailsValues({Key key, this.hourlyForecast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 25,
      child: WidgetAnimator(
        fromLeft: false,fromTop: false,
        delay: 300,
        child: Flex(direction: Axis.vertical,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 10,
              child: Padding(
                padding:  EdgeInsets.only(right: Screen(context).width()*0.55),
                child: Container(
                  alignment: Alignment.bottomCenter,

                  child: Text('${DataHelper.selectedCity.cityName}',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                  ),
                ),
              ),

            ),

            Flexible(
              fit: FlexFit.tight,
              flex: 15,
              child: Container(
                width: Screen(context).width(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    weatherTemperature(
                        width: Screen(context).width()*0.45,
                        temperature: hourlyForecast.temperature
                    ),
                    weatherProperty(
                        title: 'Wind',
                        description: '${hourlyForecast.windSpeed} Km/h'
                    ),
                    weatherProperty(
                        title: 'Humidity',
                        description: '${hourlyForecast.humidity} %'
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
