import 'package:npf_weather/model/weatherdata_current.dart';
import 'package:npf_weather/model/weatherdata_daily.dart';
import 'package:npf_weather/model/weatherdata_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataDaily? daily;
  final WeatherDataHourly? hourly;

  WeatherData([
    this.current,
    this.daily,
    this.hourly,
  ]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataDaily getDailyWeather() => daily!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}