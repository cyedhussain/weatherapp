import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/current_model.dart';
import 'package:weatherapp/data/models/current_weather_res.dart';
import 'package:weatherapp/data/models/location_modal.dart';
import 'package:weatherapp/data/repository/weather_repo.dart';

class HomeProvider  with ChangeNotifier{

  
  WeatherRepo repo;
  LocationModel? location;
  CurrentModel? current;
  bool loading =false;
  HomeProvider(this.repo){
    getCurrentWeather('london');
  }

  getCurrentWeather(String city)async{
      loading = true;
      notifyListeners();

      CurrentWeatherRes? res = await repo.getCurrentWeather(city);

      if (res!= null) {
        location = res.location;
        current = res.current;
      }

      loading = false;
      notifyListeners();
   }
        


}