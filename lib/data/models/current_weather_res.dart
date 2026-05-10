
import 'package:weatherapp/data/models/current_model.dart';
import 'package:weatherapp/data/models/location_modal.dart';

class CurrentWeatherRes {

  LocationModel location;
  CurrentModel current;

  CurrentWeatherRes(this.location,this.current);


  factory CurrentWeatherRes.fromJson(json) => CurrentWeatherRes(
    LocationModel.fromJson(json['location']),
    CurrentModel.fromJson(json['current'])

  );


}