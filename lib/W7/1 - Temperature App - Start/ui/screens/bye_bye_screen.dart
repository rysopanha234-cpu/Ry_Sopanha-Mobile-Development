import 'package:flutter/material.dart';

class ByeByeScreen extends StatelessWidget {
  const ByeByeScreen({super.key});

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.waving_hand, size: 120, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                "Bye Bye !",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              const SizedBox(height: 15),
              const Text(
                "See you next time!",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); 
                  Navigator.pop(context); 
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text(
                  'Back to Welcome',
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
