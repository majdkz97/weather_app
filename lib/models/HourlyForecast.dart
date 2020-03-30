import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/helpers/weather_converters.dart';

class HourlyForecast {
  DateTime dateTime;
  int windSpeed;
  int humidity;
  int temperature;


  HourlyForecast({this.dateTime,
    this.humidity, this.temperature, this.windSpeed
  });

  HourlyForecast.fromJson(Map<String, dynamic> json) {
    dateTime = epochsInSecondsToDateTime(json['dt']);
    windSpeed = windSpeedInMhToKMh(json['wind']['speed'].toDouble());
    temperature = temperatureInKelvinToCelsius(json['main']['temp'].toDouble());
    humidity = json['main']['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = dateTimeToEpochsInSeconds(this.dateTime);
    data['main'] = {'temp':this.temperature,'humidity':this.humidity};
    data['wind'] = {'speed':this.windSpeed};
    return data;
  }
}
