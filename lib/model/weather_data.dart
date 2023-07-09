import 'package:npf_weather/model/weatherdata_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([
    this.current,
  ]);

  WeatherDataCurrent getCurrentWeather() => current!;
}