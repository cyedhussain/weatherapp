import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/hours_model.dart';

class ItemHours extends StatelessWidget {
  final HourModel hours;

  const ItemHours({
    super.key,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [

          /// TIME
          Text(
            formatTime(hours.time ?? ""),
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          /// WEATHER ICON
          Image.network(
            hours.condition?.icon
                    ?.replaceFirst('//', 'https://') ??
                "",
            height: 45,
          ),

          /// TEMPERATURE
          Text(
            "${hours.tempC?.toStringAsFixed(0) ?? ""}°C",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(String time) {
    try {
      DateTime dateTime = DateTime.parse(time);

      int hour = dateTime.hour;
      String period = hour >= 12 ? "PM" : "AM";

      hour = hour > 12 ? hour - 12 : hour;
      hour = hour == 0 ? 12 : hour;

      return "$hour $period";
    } catch (e) {
      return time;
    }
  }
}