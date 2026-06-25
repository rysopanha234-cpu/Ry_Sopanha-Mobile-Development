import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart';


class TemperatureApp extends StatelessWidget {
  const TemperatureApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const WelcomeScreen(), 
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
