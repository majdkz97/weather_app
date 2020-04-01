import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_bloc.dart';
import 'package:weatherapp/widgets/weather_page/weather_details_screen.dart';

import 'load_error_page.dart';
import 'loading_page.dart';

class WeatherPage extends StatefulWidget {
  final DateTime dateTime;

  const WeatherPage({Key key, this.dateTime}) : super(key: key);
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
        create: (context) =>
            WeatherBloc()..add(FetchWeather(dateTime: widget.dateTime)),
        child: WeatherPageBuilder(dateTime: widget.dateTime,),
      ),
    );
  }
}

class WeatherPageBuilder extends StatefulWidget {
  final DateTime dateTime;

  const WeatherPageBuilder({Key key, this.dateTime}) : super(key: key);

  @override
  _WeatherPageBuilderState createState() => _WeatherPageBuilderState();
}

class _WeatherPageBuilderState extends State<WeatherPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        if (state is WeatherIsLoadingState)
          return LoadingPage();
        else if (state is WeatherIsLoadedState)
          return WeatherDetails(
            dailyForecast: state.dailyForecasts,
            hourlyForecast: state.dailyForecasts.hourlyForecasts.firstWhere(
              (element) => element.dateTime.compareTo(DateTime.now()) >= 1,
              orElse: () => state.dailyForecasts.hourlyForecasts.first,
            ),
          );
        else if (state is WeatherIsLoadErrorState)
          return LoadErrorPage(dateTime: widget.dateTime,error: state.error,);
        else
          return Container();
      },
    );
  }
}
