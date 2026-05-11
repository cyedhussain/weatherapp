import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/forecast_day_model.dart';
import 'package:weatherapp/screens/forecast/widgets/item_hours.dart';

class ItemsForecastDays extends StatelessWidget {
  final ForecastdayModel forecastDays;

  const ItemsForecastDays({
    super.key,
    required this.forecastDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// DATE
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Forecast",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Text(
                  forecastDays.date ?? "",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// WEATHER INFO CARD
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff8EC5FC),
                  Color(0xff4A90E2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: Row(
              children: [

                /// ICON
                Image.network(
                  forecastDays.day?.condition?.icon
                          ?.replaceFirst(
                              '//', 'https://') ??
                      "",
                  height: 90,
                ),

                const SizedBox(width: 15),

                /// DETAILS
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Text(
                        forecastDays
                                .day?.condition?.text ??
                            "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Max Temp : ${forecastDays.day?.maxtempC ?? ""}°C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Min Temp : ${forecastDays.day?.mintempC ?? ""}°C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// SUN INFO
          Row(
            children: [

              Expanded(
                child: infoCard(
                  title: "Sunrise",
                  value:
                      forecastDays.astro?.sunrise ?? "",
                  icon: Icons.wb_sunny_outlined,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: infoCard(
                  title: "Sunset",
                  value:
                      forecastDays.astro?.sunset ?? "",
                  icon: Icons.nights_stay_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// HOURLY TITLE
          const Text(
            "Hourly Forecast",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 15),

          /// HOURLY LIST
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var hour in forecastDays.hour ?? [])
                  ItemHours(hours: hour),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF4F9FF),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.blue,
            size: 30,
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}