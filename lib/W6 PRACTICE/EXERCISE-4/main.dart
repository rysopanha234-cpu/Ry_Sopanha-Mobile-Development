import 'package:flutter/material.dart';
import 'data/joke_data.dart';
import 'ui/screen/joke_card.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: JokeScreen()),
);

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  int _favoriteIndex = -1;

  
  void onFavoriteClick(int index) {
    setState(() {
      _favoriteIndex =  index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            joke: jokes[index],
            index: index,
            isFavorite: _favoriteIndex == index,
            onFavoriteClick: () => onFavoriteClick(index),
          );
        },
      ),
    );
  }
}
