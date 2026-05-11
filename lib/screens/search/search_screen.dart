import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/search/search_provider.dart';
import 'package:weatherapp/screens/weather/weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xffF4F9FF),

          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [

                /// TITLE
                const Text(
                  "Search City",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Find weather details of any city",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                /// SEARCH BAR
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: search,
                          decoration: const InputDecoration(
                            hintText: 'Search city...',
                            hintStyle: TextStyle(
                              color: Colors.black45,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.blue,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    GestureDetector(
                      onTap: () {
                        if (search.text.isNotEmpty) {
                          provider.searchRegion(search.text);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff8EC5FC),
                              Color(0xff4A90E2),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.blue.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// LOADING
                if (provider.loading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  ),

                /// SEARCH RESULTS
                for (var item in provider.item)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherScreen(item: item),
                        ),
                      );
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [

                          /// LOCATION ICON
                          Container(
                            padding:
                                const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.blue
                                  .withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.blue,
                              size: 28,
                            ),
                          ),

                          const SizedBox(width: 15),

                          /// CITY INFO
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                        FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "${item.region}, ${item.country}",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// ARROW
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.black45,
                          ),
                        ],
                      ),
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