import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/data/models/search_model.dart';
import 'package:weatherapp/provider/weather/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  final SearchModel item;

  const WeatherScreen({super.key, required this.item});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    context
        .read<WeatherProvider>()
        .getCurrentWeather(widget.item.name ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xffF4F9FF),

          body: provider.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [

                        /// TOP BAR
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ),
                            ),

                            const Text(
                              "Weather",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// MAIN CARD
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff87CEFA),
                                Color(0xff4A90E2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.blue.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [

                              Text(
                                provider.location?.name ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                "${provider.location?.region ?? ""}, ${provider.location?.country ?? ""}",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 25),

                              Image.network(
                                provider.current?.condition?.icon
                                        ?.replaceFirst(
                                            '//', 'https://') ??
                                    "",
                                height: 120,
                              ),

                              const SizedBox(height: 15),

                              Text(
                                "${provider.current?.tempC?.toStringAsFixed(0) ?? ""}°C",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                provider.current?.condition?.text ??
                                    "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// DETAILS TITLE
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Weather Details",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// DETAILS CARDS
                        Row(
                          children: [
                            Expanded(
                              child: weatherCard(
                                title: "Wind",
                                value:
                                    "${provider.current?.windKph ?? ""} km/h",
                                icon: Icons.air,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: weatherCard(
                                title: "Cloud",
                                value:
                                    "${provider.current?.cloud ?? ""}%",
                                icon: Icons.cloud,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: weatherCard(
                                title: "Humidity",
                                value:
                                    "${provider.current?.humidity ?? ""}%",
                                icon: Icons.water_drop,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: weatherCard(
                                title: "Feels Like",
                                value:
                                    "${provider.current?.feelslikeC ?? ""}°C",
                                icon: Icons.thermostat,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget weatherCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 35,
          ),

          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}