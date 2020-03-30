import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final DateTime dateTime;

  FetchWeather({this.dateTime});
  @override
  List<Object> get props => [this.dateTime];
}
