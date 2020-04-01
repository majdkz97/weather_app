import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/bloc.dart';
import 'package:weatherapp/widgets/weather_page/back_button.dart';

import '../routes.dart';

class LoadErrorPage extends StatelessWidget {
  final DateTime dateTime;
  final String error;
  const LoadErrorPage({Key key, this.dateTime,this.error}) : super(key: key);

  onRefreshButtonPressed(BuildContext context){

      BlocProvider.of<WeatherBloc>(context)
        ..add(FetchWeather(
            dateTime: dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigatorBackButton(
          from: Router.weatherRoute,
          to: Router.homeRoute,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: FlareActor('assets/weather_conditions.flr',animation: 'wind',),
            )
            ,Text(error),
            Padding(
              padding:  EdgeInsets.only(top: 15),
              child: RaisedButton(
                  onPressed:() => onRefreshButtonPressed(context),
                  color: Theme.of(context).accentColor,
                  child: Text('Refresh',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
