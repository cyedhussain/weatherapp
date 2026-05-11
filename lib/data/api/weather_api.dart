import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/data/models/current_weather_res.dart';
import 'package:weatherapp/data/models/forecast_day_model.dart';
import 'package:weatherapp/data/models/search_model.dart';
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

  Future<List<ForecastdayModel>> getForecastWeather(String city, int days) async{
     try {
        final res = await http.get(Uri.parse('$baseUrl/forecast.json?key=7b34a1225d094a7fa9a100245260905&q=London&days=1&aqi=no&alerts=no'));

      final data = jsonDecode(res.body);
      List dataList =data['forecast']['forecastday'];

      List<ForecastdayModel> forecastDays = dataList.map((e)=> 
      ForecastdayModel.fromJson(e)).toList();
      return forecastDays;
 
     } catch (e) {

       print(e);
     }
     return [];
  }

 Future<List<SearchModel>> searchRegion(String city) async {

    try {
          final response = await http.get(Uri.parse('$baseUrl/search.json?key=7b34a1225d094a7fa9a100245260905&q=$city'));
          // ignore: unused_local_variable
          List data = jsonDecode(response.body);
          // ignore: unused_local_variable
          List<SearchModel> items = data.map((e) =>
          SearchModel.fromJson(e)).toList();
          return items;
           

    } catch (e) {
      print(e);
    }
    return [];

  }

}