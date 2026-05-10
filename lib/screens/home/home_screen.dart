import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/home/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider , child ){
        return provider.loading? Center(child: CircularProgressIndicator(),) : Column(
          children: [
            Text(provider.location?.country?? 'no data')
          ],
        );
      }
    );
  }
}