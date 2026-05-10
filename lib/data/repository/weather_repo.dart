import 'package:weatherapp/data/api/weather_api.dart';
import 'package:weatherapp/data/models/current_weather_res.dart';

class WeatherRepo {
  WeatherApi api;
  WeatherRepo(this.api);

  Future<CurrentWeatherRes?> getCurrentWeather(String city) async {
   CurrentWeatherRes? response =  await api.getCurrentWeather(city);
   return response;
  }

}