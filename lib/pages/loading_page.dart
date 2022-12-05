import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/routes.dart';
import 'package:weatherapp/widgets/weather_page/back_button.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigatorBackButton(
          from: AppRouter.weatherRoute,
          to: AppRouter.homeRoute,
        ),
      ),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            child: FlareActor('assets/weather_conditions.flr',animation: '03d',),
          )
          ,Text('Loading...')
        ],
      ),),
    );
  }
}
