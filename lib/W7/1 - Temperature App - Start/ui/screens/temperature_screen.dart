import 'package:flutter/material.dart';
import 'bye_bye_screen.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  double input = 0;

  void celciusToFarenheit(String value) {
    final parsed = double.tryParse(value);
    if (parsed != null) {
      setState(() {
        input = ((int.parse(value) * 1.8) + 32);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff16C062), Color(0xff00BCDC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ],
              ),
              const Icon(
                Icons.thermostat_outlined,
                size: 120,
                color: Colors.white,
              ),
              const Center(
                child: Text(
                  "Converter",
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Temperature in Degrees:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: celciusToFarenheit,
                decoration: inputDecoration,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                "Temperature in Fahrenheit:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("${input.toStringAsFixed(2)} °F"),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ByeByeScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
