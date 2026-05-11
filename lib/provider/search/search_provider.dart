import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/search_model.dart';
import 'package:weatherapp/data/repository/weather_repo.dart';

class SearchProvider with ChangeNotifier {
  WeatherRepo repo;
  List<SearchModel> item =[];
  bool loading = false;
  SearchProvider(this.repo);

  searchRegion(String city) async {
    loading = true;
    notifyListeners();
    item = await repo.searchRegions(city);
    loading = false;
    notifyListeners();

  }

}