import 'package:weatherapp/models/city.dart';
import 'package:weatherapp/themes/app_theme.dart';

class DataHelper {

  static const String endPoint = 'http://api.openweathermap.org/data/2.5/';
  static City cityDubai = City(
      cityId: '292223',
      cityName: 'Dubai'
  );
  static City cityAleppo = City(
      cityId: '170062',
      cityName: 'Aleppo'
  );
  static City cityMoscow = City(
      cityId: '524901',
      cityName: 'Moscow'
  );
  static City selectedCity= cityDubai;
  static AppThemes selectedTheme = AppThemes.darkMode;

  static const String appId = '6f1f4423841193bb9773d5159a35d7de';
}