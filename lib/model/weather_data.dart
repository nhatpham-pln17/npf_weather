import 'package:npf_weather/model/weatherdata_current.dart';
import 'package:npf_weather/model/weatherdata_daily.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataDaily? daily;

  WeatherData([
    this.current,
    this.daily,
  ]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataDaily getDailyWeather() => daily!;
}