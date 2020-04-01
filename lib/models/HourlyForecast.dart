import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/helpers/weather_converters.dart';

class HourlyForecast {
  DateTime dateTime;
  int windSpeed;
  int humidity;
  int temperature;
  String icon;
  String status;

  HourlyForecast({this.dateTime,
    this.humidity, this.temperature, this.windSpeed
  });

  HourlyForecast.fromJson(Map<String, dynamic> json) {
    dateTime = epochsInSecondsToDateTime(json['dt']);
    windSpeed = windSpeedInMhToKMh(json['wind']['speed'].toDouble());
    temperature = temperatureInKelvinToCelsius(json['main']['temp'].toDouble());
    humidity = json['main']['humidity'];
    status = json['weather'].first['description'].toString().split(' ').map((e) => e=e.replaceRange(0, 1, e[0].toUpperCase())).join('\n');
    icon = json['weather'].first['icon'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = dateTimeToEpochsInSeconds(this.dateTime);
    data['main'] = {'temp':temperatureInCelsiusToKelvin(this.temperature.toDouble()),'humidity':this.humidity};
    data['wind'] = {'speed':this.windSpeed};
    data['weather'] = [{'description':status,'icon':icon}];

    return data;
  }
}
