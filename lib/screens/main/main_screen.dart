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
  final List<Widget> widgets = [
    HomeScreen(),
    SearchScreen(),
    ForecastScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffF4F9FF),

      body: widgets[provider.currentIndex],

      /// MODERN BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.changeIndex(index);
          },

          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cloud_fog),
              label: 'Forecast',
            ),
          ],
        ),
      ),
    );
  }
}