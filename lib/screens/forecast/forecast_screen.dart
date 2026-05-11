import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/forecast/forecast_provider.dart';
import 'package:weatherapp/screens/forecast/widgets/items_forecast.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xffF4F9FF),

          body: provider.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      /// TITLE SECTION
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "Forecast",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight:
                                    FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Next weather updates",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// FORECAST LIST
                      Expanded(
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.all(20),
                          itemCount:
                              provider.forecastDays.length,
                          itemBuilder: (context, index) {
                            final day =
                                provider.forecastDays[index];

                            return ItemsForecastDays(
                              forecastDays: day,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}