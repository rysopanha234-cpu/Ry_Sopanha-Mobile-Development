import 'package:flutter/material.dart';
import '../../model/joke_model.dart';

Color appColor = Colors.green[300] as Color;

class JokeCard extends StatelessWidget {
  final JokeModel joke;
  final bool isFavorite;
  final int index;
  final VoidCallback onFavoriteClick;

  const JokeCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.index,
    required this.onFavoriteClick,
  });
   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey, //usegetter for this to get colors
            ),
          ),
        ],
      ),
    );
  }
}
