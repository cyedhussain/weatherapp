import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/main/main_provider.dart';
import 'package:weatherapp/screens/forecast/forecast_screen.dart';
import 'package:weatherapp/screens/home/home_screen.dart';
import 'package:weatherapp/screens/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> widgets =[
    HomeScreen(),
    SearchScreen(),
    ForecastScreen(),

  ];

  @override
  Widget build(BuildContext context) {
      final provider = context.watch<MainProvider>();

    return Scaffold(
      appBar: AppBar(
       
      ),
      body: widgets[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.changeIndex(index);
        },
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search) ,label: 'search'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cloud_fog),label: 'forecast')
        ]
        ),
    );
  }
}