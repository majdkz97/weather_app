import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/models/daily_forecast.dart';
import 'package:weatherapp/repositories/api/weather/weather_api.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoadingState();

      var resultFromStorage =
          await DailyForecast.getWeatherForecastsFromStorage(
              dateTime: event.dateTime);
      if (resultFromStorage != null) {
        print('Get ${dateTimeToString(event.dateTime)} Forecast From Storage');
        yield WeatherIsLoadedState(dailyForecasts: resultFromStorage);
      } else {
        var resultsFromApi = await WeatherApi().getWeatherForecast();
        if (resultsFromApi != null) {
          DailyForecast dailyForecast = resultsFromApi.firstWhere(
              (element) => compareDates(element.dateTime, event.dateTime),orElse: () => resultsFromApi.first,);
          DailyForecast.saveWeatherForecastsInStorage(
              dateTime: dailyForecast.dateTime, dailyForecast: dailyForecast);
          print('Get ${dateTimeToString(event.dateTime)} Forecast From Api');
          yield WeatherIsLoadedState(dailyForecasts: dailyForecast);
        } else {
          print('Get ${dateTimeToString(event.dateTime)} Forecast Error From Api');
          yield WeatherIsLoadErrorState(error: 'Sorry, There is an error');
        }
          }
    }
  }
}
