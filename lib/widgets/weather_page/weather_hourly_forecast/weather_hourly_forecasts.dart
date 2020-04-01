import 'package:flutter/material.dart';
import 'package:weatherapp/models/DailyForecast.dart';
import 'package:weatherapp/widgets/animator.dart';
import 'package:weatherapp/widgets/weather_page/weather_hourly_forecast/weather_hourly_item.dart';

class WeatherHourlyForecasts extends StatelessWidget {
  final DailyForecast dailyForecast;

  const WeatherHourlyForecasts({Key key, this.dailyForecast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 100,
      child: WidgetAnimator(
        fromLeft: false,fromTop: false,
        delay: 300,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
           itemCount: dailyForecast.hourlyForecasts.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
           itemBuilder: (context,index){
            return  WeatherHourlyItem(
              hourlyForecast: dailyForecast.hourlyForecasts[index],
            );
           },
        )
      ),
    );
  }
}
