import 'dart:convert';

import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/models/HourlyForecast.dart';
import 'package:weatherapp/repositories/storage_service.dart';

class DailyForecast {

  List<HourlyForecast> hourlyForecasts;
  DateTime dateTime;

  DailyForecast({
    this.hourlyForecasts,
    this.dateTime
  });

  DailyForecast.fromJson(Map<String, dynamic> json) {
    dateTime = DateTime.fromMillisecondsSinceEpoch(json['dateTime']);
     if (json['hourlyForecasts'] != null) {
      hourlyForecasts = List<HourlyForecast>();
      json['hourlyForecasts'].forEach((v) {
        hourlyForecasts.add(HourlyForecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime.millisecondsSinceEpoch;
     if (this.hourlyForecasts != null) {
      data['hourlyForecasts'] = this.hourlyForecasts.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<DailyForecast> convertHourlyToDaily(
      List<HourlyForecast> hourlyForecasts) {
    List<DailyForecast> dailyForecasts = List<DailyForecast>();
    DateTime previousDateTime = hourlyForecasts?.first?.dateTime;
    dailyForecasts.add(DailyForecast(
        dateTime: previousDateTime,
        hourlyForecasts: List<HourlyForecast>()
    ));
    hourlyForecasts.forEach((element) {
      if (compareDates(previousDateTime, element.dateTime)) {
        dailyForecasts.last.hourlyForecasts.add(element);
      }
      else {
        dailyForecasts.add(DailyForecast(
            dateTime: element.dateTime,
            hourlyForecasts: [element]
        ));
      }
      previousDateTime = element.dateTime;
    });
    return dailyForecasts;
  }

  static Future<bool> saveWeatherForecastsInStorage({DateTime dateTime,DailyForecast dailyForecast}) async
  {
    await StorageService().write(DataHelper.selectedCity.cityId+dateTimeToString(dateTime),jsonEncode(dailyForecast.toJson()));
    return true;
  }

  static Future<DailyForecast> getWeatherForecastsFromStorage({DateTime dateTime}) async
  {
    var result = await StorageService().read(DataHelper.selectedCity.cityId+dateTimeToString(dateTime));
    if(result==null)
      return null;
    else
      return DailyForecast.fromJson(jsonDecode(result));
  }



}