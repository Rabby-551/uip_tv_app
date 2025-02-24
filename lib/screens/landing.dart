import 'package:flutter/material.dart';
import 'package:uip_tv_app/screens/api_data_page/api_data_screen.dart';
import 'package:uip_tv_app/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const Text('Home Design page')),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ApiDataScreen()),
                  );
                },
                child: const Text('Api Data page')),
          ],
        ),
      ),
    );
  }
}
