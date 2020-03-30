import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_bloc.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String text = 'Weather Screen';

  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc()..
        add(FetchWeather(dateTime: DateTime.now().add(Duration(days: 1)))),
        child: WeatherPageBuilder(),
      ),
    );
  }
}

class WeatherPageBuilder extends StatefulWidget {
  @override
  _WeatherPageBuilderState createState() => _WeatherPageBuilderState();
}

class _WeatherPageBuilderState extends State<WeatherPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        if (state is WeatherIsLoadingState)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is WeatherIsLoadedState)
          return Container(
            child: Center(
              child: Text(state.dailyForecasts.toJson().toString()),
            ),
          );
        else if (state is WeatherIsLoadErrorState)
          return Center(
            child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context)..add(FetchWeather(
                      dateTime: DateTime.now().add(Duration(days: 1))));
                },
                child: Text('Error')),
          );
        else
          return Container();
      },
    );
  }
}
