import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/helpers/screen.dart';
import 'package:weatherapp/models/DailyForecast.dart';
import 'package:weatherapp/models/HourlyForecast.dart';
import 'package:weatherapp/widgets/weather_page/weather_hourly_forecast/weather_date.dart';
import 'package:weatherapp/widgets/weather_page/weather_now/weather_status.dart';
import '../../routes.dart';
import 'back_button.dart';
import 'weather_hourly_forecast/weather_hourly_forecasts.dart';
import 'weather_now/weather_condition_flare.dart';
import 'weather_now/weather_details_values.dart';

class WeatherDetails extends StatefulWidget {
  final HourlyForecast hourlyForecast;
  final DailyForecast dailyForecast;

  const WeatherDetails({Key key, this.hourlyForecast,this.dailyForecast}) : super(key: key);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  bool isHourlyPage = false;
  String timeStatus = 'Hourly Forecast';
  PageController pageController = PageController(initialPage: 0);

  void onPageChange(int index){
    setState(() {
      isHourlyPage = !isHourlyPage;
      timeStatus = isHourlyPage?'Now':'Hourly Forecast';
    });
  }

  void onPageButtonPressed(){
    pageController.animateToPage(isHourlyPage?0:1,
        duration: Duration(milliseconds: 600),
        curve: Curves.linearToEaseOut
    );
  }

  void onBackButtonPressed(){
    Navigator.pop(context);
    print('Pop Route: ${Router.weatherRoute}');
    print('Current Route: ${Router.homeRoute}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: (index)=>onPageChange(index),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),

          children: <Widget>[
            Container(
             // color: Theme.of(context).colorScheme.onSecondary,
              padding: EdgeInsets.only(top: Screen(context).statusBar()),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  weatherStatus(status: widget.hourlyForecast.status),
                  weatherConditionFlare(icon: widget.hourlyForecast.icon),
                  WeatherDetailsValues(hourlyForecast: widget.hourlyForecast,),
                  Spacer(flex: 5,)
                ],
              ),
            ),
            Container(
             // color: Theme.of(context).colorScheme.onSecondary,
              padding: EdgeInsets.only(top: Screen(context).statusBar()),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  weatherDate(dateTime: widget.hourlyForecast.dateTime),
                  Container(
                    alignment: Alignment.center,

                    child: Text('${DataHelper.selectedCity.cityName}',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                    ),
                  ),
                  WeatherHourlyForecasts(dailyForecast:widget.dailyForecast ,)
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: Screen(context).statusBar(),
          child:  NavigatorBackButton(
            from: Router.weatherRoute,
            to: Router.homeRoute,
          ),
        ),
        Positioned(
          top: Screen(context).statusBar(),
          right:0 ,
          child: FlatButton(
              child: Row(
                children: <Widget>[
                  Text(timeStatus,style: TextStyle(color: Colors.white),),
                  Icon(isHourlyPage?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: Colors.white,
                  )
                ],
              ),
              onPressed:onPageButtonPressed ),
        )
      ],
    );
  }
}
