import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/current_model.dart';
import 'package:weatherapp/data/models/current_weather_res.dart';
import 'package:weatherapp/data/models/location_modal.dart';
import 'package:weatherapp/data/repository/weather_repo.dart';

class WeatherProvider with ChangeNotifier {
WeatherRepo repo;
LocationModel? location;
CurrentModel? current;
bool loading =false;
WeatherProvider(this.repo);


 getCurrentWeather(String city)async{
      loading = true;
      notifyListeners();

      CurrentWeatherRes? res = await repo.getCurrentWeather(city);

      if (res!= null) {
        location = res.location;
        current = res.current;
      }
      print(res);
      loading = false;
      notifyListeners();
   }
    

}