import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/data/models/current_weather_res.dart';
class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<CurrentWeatherRes?> getCurrentWeather(String city) async{
    try {
     final res = await http.get(Uri.parse('$baseUrl/current.json?key=7b34a1225d094a7fa9a100245260905&q=$city&aqi=no'));
     final data = jsonDecode(res.body);
      CurrentWeatherRes response = CurrentWeatherRes.fromJson(data);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}