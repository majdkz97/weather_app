import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/models/DailyForecast.dart';
import 'package:weatherapp/models/HourlyForecast.dart';
import '../api_service.dart';

class WeatherApi extends ApiService {
  Future<List<DailyForecast>> getWeatherForecast() async {
    try {
      params.addAll({
        'id':'${DataHelper.cityId}',
        'appid':'${DataHelper.appId}'
      });
      var response = await request(HttpMethod.GET, 'forecast');
      Map<String,dynamic> data = response;
      List<HourlyForecast> hourlyForecasts= (data['list'] as List<dynamic>)
          .map((v) => v as Map<String, dynamic>)
          .map((v) => HourlyForecast.fromJson(v))
           .toList();

      return DailyForecast.convertHourlyToDaily(hourlyForecasts);
    } catch (e) {
      print(e);
      return null;
    }
  }


}
