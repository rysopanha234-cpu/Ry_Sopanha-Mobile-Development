
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String label;
  final Color background;

  const BuildButton({super.key ,required this.label, this.background = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              BuildButton(label: "hello 1", background: Colors.blue),
              BuildButton(label: "hello 2", background: Colors.blue),
              BuildButton(label: "hello 3", background: Colors.blue),
            ],
          ),
        ),
      ),
    ),
  );
}
