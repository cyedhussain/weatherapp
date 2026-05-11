import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/hours_model.dart';

class ItemHours extends StatelessWidget {
  final HourModel hours;
  const ItemHours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Image.network(hours.condition?.icon?.replaceFirst('//', 'https://')?? ""),
          Text('${hours.tempC}C'),
          Text(hours.time?? "",style: Theme.of(context).textTheme.bodySmall,)
        ],
      ),
    );
  }
}