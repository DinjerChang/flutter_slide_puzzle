import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/game-board.dart';

void main() {
  runApp(const SlidePuzzle());
}

class SlidePuzzle extends StatelessWidget {
  const SlidePuzzle({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlidePuzzle',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
        textButtonTheme: const TextButtonThemeData(
            //style: TextButton.styleFrom(primary: Colors.blue),
            ),
      ),
      home: const SlidePuzzlePage(title: 'Ancient Slide Puzzle'),
    );
  }
}

class SlidePuzzlePage extends StatefulWidget {
  const SlidePuzzlePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SlidePuzzlePage> createState() => _SlidePuzzlePageState();
}

class _SlidePuzzlePageState extends State<SlidePuzzlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
            // Here we take the value from the SlidePuzzle object that was created by
            // the App.build method, and use it to set our appbar title.
            leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.puzzlePiece,
                    color: Colors.blue[900]),
                onPressed: () {}),
            title: Text(widget.title,
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold)),
            actions: <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.pause, color: Colors.blue[900]),
                tooltip: "Start Game",
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Game is Paused',
                      textAlign: TextAlign.center,
                    ),
                    //content: const Text('Game Story Description'),
                    actions: <Widget>[
                      Center(
                        child: TextButton(
                            onPressed: () => Navigator.pop(context, 'Resume'),
                            child: const Text('Resume',
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.yellow))),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.questionCircle,
                    color: Colors.blue[900]),
                tooltip: "How to Play",
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'How to Play',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text('Game Story Description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              )
            ]),
        body: SingleChildScrollView(child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GameBoard(),
          ],
        )
        ) 
);
  }
}
