import 'package:flutter/material.dart';
import 'package:weatherapp/data/models/forecast_day_model.dart';
import 'package:weatherapp/screens/forecast/widgets/item_hours.dart';

class ItemsForecastDays extends StatelessWidget {

  final ForecastdayModel forecastDays;

  const ItemsForecastDays({super.key, required this.forecastDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Date'),
            trailing: Text(forecastDays.date?? ""),
          ),
          ListTile(
            title: Text('Condition'),
            trailing: Text(forecastDays.day?.condition?.text?? " "),
            leading: Image.network(forecastDays.day?.condition?.icon?.replaceFirst('//', 'https://')?? "" ),
          ),
          ListTile(
            title: Text('Max temperature'),
            trailing: Text(forecastDays.day?.maxtempC.toString()?? ""),
          ),
          ListTile(
            title: Text('Min Temperature'),
            trailing: Text(forecastDays.day?.mintempC.toString()?? ""),
          ),
          ListTile(
            title: Text('Sunset'),
            trailing: Text(forecastDays.astro?.sunset?? ""),
          ),
          ListTile(
            title: Text('Sunrise'),
            trailing: Text(forecastDays.astro?.sunrise?? ""),
          ),
          Divider(),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var hour in forecastDays.hour?? [])
                  ItemHours(hours: hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}