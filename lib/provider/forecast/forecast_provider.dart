import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/forecast_day_model.dart';
import 'package:weatherapp/data/repository/weather_repo.dart';

class ForecastProvider with ChangeNotifier{
  WeatherRepo repo;
  List<ForecastdayModel> forecastDays = [];
  bool loading = false;

  ForecastProvider(this.repo){
    getForecast();
  }
  
  getForecast()async{
    loading = true;
    notifyListeners();
    forecastDays = await repo.getForecast("Faisalabad", 3);
    loading = false;
    notifyListeners();
  }

}