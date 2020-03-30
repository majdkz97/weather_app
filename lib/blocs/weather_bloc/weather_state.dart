import 'package:equatable/equatable.dart';
import 'package:weatherapp/models/DailyForecast.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {

  @override
  List<Object> get props => [];
}

class WeatherIsLoadingState extends WeatherState {

  @override
  List<Object> get props => [];
}

class WeatherIsLoadedState extends WeatherState {
  final DailyForecast dailyForecasts;

  WeatherIsLoadedState({this.dailyForecasts});
  @override
  List<Object> get props => [this.dailyForecasts];
}

class WeatherIsLoadErrorState extends WeatherState {
  final String error;

  WeatherIsLoadErrorState({this.error});
  @override
  List<Object> get props => [this.error];
}