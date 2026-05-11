import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/forecast/forecast_provider.dart';
import 'package:weatherapp/screens/forecast/widgets/items_forecast.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(builder:  (context, provider, child){
      return provider.loading? Center(child: CircularProgressIndicator()): ListView(
        children: [
          for (var day in provider.forecastDays)
            ItemsForecastDays(forecastDays: day)

        ],
      );
    });
  }
}