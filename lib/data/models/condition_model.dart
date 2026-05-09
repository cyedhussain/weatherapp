// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals


import 'package:weatherapp/data/models/forecast_day_model.dart';

class ConditionModel {
  String? text;
  String? icon;
  int? code;

  ConditionModel({this.text, this.icon, this.code});

  ConditionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}

class Forecast {
  List<ForecastdayModel>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <ForecastdayModel>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new ForecastdayModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastday != null) {
      data['forecastday'] = this.forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
