import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'package:flutter_slide_puzzle/controller.dart';

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
  // 把接收到的參數存到變數
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) print(arguments['Player1']);
    String player1 = arguments['Player1'];
    String player2 = arguments['Player2'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // Here we take the value from the SlidePuzzle object that was created by
          // the App.build method, and use it to set our appbar title.
          leading: IconButton(
              icon:
                  FaIcon(FontAwesomeIcons.puzzlePiece, color: Colors.blue[900]),
              onPressed: () {}),
          title: Text(widget.title,
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(
              icon: FaIcon(FontAwesomeIcons.pause, color: Colors.blue[900]),
              tooltip: "Pause Game",
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
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Player1(playername : player1),
          GameBoard(),
          Player2(playername : player2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          icon: Restart(),
          label: Text('Restart'),
          onPressed: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => super.widget));
            // ;
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
