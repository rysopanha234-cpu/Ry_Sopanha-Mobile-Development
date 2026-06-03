import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.position,
    required this.type,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  Color _getContentColor() {
    return Colors.purple; 
  }

 @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, color: _getContentColor());
    final textWidget = Text(
      label,
      style: TextStyle(color: _getContentColor(), fontSize: 18),
    );

    List<Widget> rowChildren;

    if (position == IconPosition.left) {
      rowChildren = [iconWidget, const SizedBox(width: 10), textWidget];
    } else {
      rowChildren = [textWidget, const SizedBox(width: 10), iconWidget];
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ),
    );
  }
}


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                position: IconPosition.left,
                type: ButtonType.primary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Time",
                icon: Icons.access_time,
                position: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Account",
                icon: Icons.account_box,
                position: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}



