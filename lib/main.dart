import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/start.dart';
import 'package:flutter_slide_puzzle/game.dart';

void main() {
  runApp(const SlidePuzzle());
}

class SlidePuzzle extends StatelessWidget {
  const SlidePuzzle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharaoh\'s Bedroom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StartPage(),
      routes: <String, WidgetBuilder>{
        '/game': (_) => SlidePuzzlePage(title: 'Pharaoh\'s Bedroom'),
        '/start': (_) => StartPage(),
      },
    );
  }
}
