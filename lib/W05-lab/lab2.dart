import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget{
  final String text; 
  final Color start; 
  final  Color end; 

  const GradiantButton( this.text, {super.key,required this.start, required this.end,});



  @override
  Widget build(BuildContext context) {
    return Container(
         padding: const EdgeInsets.all(20),
         margin: const EdgeInsets.all(20),
         


         decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [start , end]
         ),
         borderRadius: BorderRadius.circular(30),
        ),

        child : Text(
          text,
          style:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
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
              GradiantButton("hello 1", start: Colors.blue, end: Colors.red),
              GradiantButton("hello 2", start: Colors.blue, end: Colors.red),
              GradiantButton("hello 3", start: Colors.blue, end: Colors.red),

            ],
            
          ),
        ),
      ),
    ),
  );
}





