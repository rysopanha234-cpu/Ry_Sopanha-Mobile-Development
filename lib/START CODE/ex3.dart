import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
  
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

        
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'DART',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Color(0xFF0D47A1), 
                ],
              ),
            ),
            child: Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
