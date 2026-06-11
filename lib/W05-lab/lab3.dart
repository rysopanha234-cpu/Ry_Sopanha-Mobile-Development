import 'dart:math';

import 'package:flutter/material.dart';

List dices = [
  'assets/dices/dice-1.png',
  'assets/dices/dice-2.png',
  'assets/dices/dice-3.png',
  'assets/dices/dice-4.png',
  'assets/dices/dice-5.png',
  'assets/dices/dice-6.png',
];

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = 'assets/dices/dice-1.png' ;

  void rollDice() {
    setState(() {
      activeDiceImage = dices[Random().nextInt(6)];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
