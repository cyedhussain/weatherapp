import 'package:weatherapp/data/api/weather_api.dart';
import 'package:weatherapp/data/models/current_weather_res.dart';
import 'package:weatherapp/data/models/forecast_day_model.dart';
import 'package:weatherapp/data/models/search_model.dart';

class WeatherRepo {
  WeatherApi api;
  WeatherRepo(this.api);

  Future<CurrentWeatherRes?> getCurrentWeather(String city) async {
   CurrentWeatherRes? response =  await api.getCurrentWeather(city);
   return response;
  }
  Future<List<ForecastdayModel>>  getForecast(String city, int days)async{

     List<ForecastdayModel> forecastDays=await api.getForecastWeather(city, days);
      return forecastDays;
  }

  Future<List<SearchModel>> getRegion(String city) async{
        List<SearchModel> items  = await api.searchRegion(city);
        return items;
  }

}