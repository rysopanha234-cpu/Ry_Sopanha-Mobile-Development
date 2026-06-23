import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/bye_bye_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

//use enum
enum Screen { welcome, converter, byebye }

class _TemperatureAppState extends State<TemperatureApp> {
  Screen _currentScreen = Screen.welcome;

  @override
  Widget build(context) {
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
          child: switch (_currentScreen) {
            Screen.welcome => WelcomeScreen(
              onStart: () {
                setState(() {
                  _currentScreen = Screen.converter;
                });
              },
            ),
            Screen.converter => TemperatureScreen(
              onDone: () {
                setState(() {
                  _currentScreen = Screen.byebye;
                });
              },
              onBack: () {
                setState(() {
                  _currentScreen = Screen.welcome;
                });
              },
            ),
            Screen.byebye => ByeByeScreen(
              onRestart: () {
                setState(() {
                  _currentScreen = Screen.welcome;
                });
              },
            ),
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
