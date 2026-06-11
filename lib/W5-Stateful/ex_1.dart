import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;

  String get buttonText {
    if (isSelected) {
      return "Selected";
    } else {
      return "Not Selected";
    }
  }

  Color get textColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color? get backgroundColor {
    if (isSelected) {
      return const Color(0xFF6BC6E6);
    } else {
      return const Color(0xFFE2E8F0);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Center(child: Text(buttonText),),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(),
            SizedBox(height: 20),
            Button(),
            SizedBox(height: 20),
            Button(),
          ],
          
        ),
      ),
    ),
  ),
);
