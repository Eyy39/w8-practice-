import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: FavoriteJokeScreen(),
    ));

class FavoriteJokeScreen extends StatefulWidget {
  const FavoriteJokeScreen({
    super.key,
  });

  @override
  State<FavoriteJokeScreen> createState() => _FavoriteJokeScreenState();
}

class _FavoriteJokeScreenState extends State<FavoriteJokeScreen> {
  int? jokeIndex;
  void onFavoriteClick(int index) {
    setState(() {
      if (jokeIndex == index) {
        jokeIndex = null;
      } else {
        jokeIndex = index;
      }
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
        itemCount: jokesData.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
              jokes: jokesData[index],
              isFavorite: jokeIndex == index,
              onFavoriteClick: () => onFavoriteClick(index));
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.jokes,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final Jokes jokes;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

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
                  jokes.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(jokes.description),
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
