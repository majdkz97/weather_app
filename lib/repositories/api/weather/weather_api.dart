import 'package:weatherapp/helpers/data_helper.dart';
import '../api_service.dart';

class WeatherApi extends ApiService {
  Future<Map<String,dynamic>> getWeatherForecast() async {
    try {
      params.addAll({
        'id':'${DataHelper.cityId}',
        'appid':'${DataHelper.appId}'
      });
      var response = await request(HttpMethod.GET, 'forecast');
      Map<String,dynamic> data = response;
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }


}
