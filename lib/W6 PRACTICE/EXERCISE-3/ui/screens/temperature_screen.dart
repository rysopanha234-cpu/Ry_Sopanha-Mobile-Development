import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback onDone;
  final VoidCallback onBack;
  const TemperatureScreen({super.key, required this.onDone , required this.onBack});

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
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: widget.onBack, 
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
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
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),

            TextField(
              onChanged: (value) {
                celciusToFarenheit(value);
              },
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("${input.toStringAsFixed(2)}°F"),
            ),

            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: widget.onDone,
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
    );
  }
}
