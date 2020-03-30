import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/models/HourlyForecast.dart';

class DailyForecast{

  List<HourlyForecast> hourlyForecasts;
  DateTime dateTime;
  DailyForecast({
    this.hourlyForecasts,
    this.dateTime
});

  static List<DailyForecast> convertHourlyToDaily(List<HourlyForecast> hourlyForecasts){
    List<DailyForecast> dailyForecasts = List<DailyForecast>();
    DateTime previousDateTime = hourlyForecasts?.first?.dateTime;
    dailyForecasts.add(DailyForecast(
        dateTime: previousDateTime,
        hourlyForecasts: List<HourlyForecast>()
    ));
    hourlyForecasts.forEach((element) {
      if(compareDates(previousDateTime, element.dateTime))
      {
        dailyForecasts.last.hourlyForecasts.add(element);
      }
      else
      {
        dailyForecasts.add(DailyForecast(
            dateTime: element.dateTime,
            hourlyForecasts: [element]
        ));
      }
      previousDateTime = element.dateTime;
    });
    return dailyForecasts;
  }


}