import 'package:flutter/material.dart';

class ByeByeScreen extends StatelessWidget {
  final VoidCallback onRestart;
  const ByeByeScreen({super.key, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.waving_hand, size: 120, color: Colors.white),

          const SizedBox(height: 20),
          const Text("Bye Bye", style: TextStyle(color: Colors.white)),

          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: onRestart,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
