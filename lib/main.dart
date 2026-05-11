import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/data/api/weather_api.dart';
import 'package:weatherapp/data/repository/weather_repo.dart';
import 'package:weatherapp/provider/forecast/forecast_provider.dart';
import 'package:weatherapp/provider/home/home_provider.dart';
import 'package:weatherapp/provider/main/main_provider.dart';
import 'package:weatherapp/provider/search/search_provider.dart';
import 'package:weatherapp/provider/weather/weather_provider.dart';
import 'package:weatherapp/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider()),
        Provider(create: (context) => WeatherApi()),
        Provider(create:(context) => WeatherRepo(context.read<WeatherApi>())),
        ChangeNotifierProvider(create: (context) => HomeProvider (context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context) => ForecastProvider (context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context) => SearchProvider (context.read<WeatherRepo>())),
        ChangeNotifierProvider(create: (context) => WeatherProvider (context.read<WeatherRepo>())),

      ],
      child: MaterialApp(
      title: 'weatherApp',
     
      home: const MainScreen()
    ),
      );
  }
}

