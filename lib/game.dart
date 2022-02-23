import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'package:flutter_slide_puzzle/controller.dart';
import 'package:flutter_slide_puzzle/win-modal.dart';


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
  String player1 = "player1";
  String player2 = "player2";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null)
      print(arguments['Player1'] + ',' + arguments['Player2']);
    final String player1 = arguments['Player1'];
    final String player2 = arguments['Player2'];

    // print("player1_win: " + player1_win.toString());
    // Output : player1_win: false
    // 這邊就可以直接抓到 player1_win，因為我有 import win-modal.dart，可以直接讀到這個變數。證明初始值為 false

    // player2_win = true;
    // 這行測試用我先寫死，所以我傳給你的 demo 影片，一跳轉到 game page 就會跳出贏家提示。測完我就註解掉了

    // if (player1_win == true) {
    //   //這裡就是根據布林值，帶入不同使用者的名字，並去呼叫 Winner 函示 (在 win-modal.dart)
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     Winner(context, player1);
    //   });
    // }

    // if (player2_win == true) {
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     Winner(context, player2);
    //   });
    // }
    player1_win = false;
    player2_win = false;

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
          Player1(playername: player1),
          GameBoard(player1name: player1, player2name: player2),
          Player2(playername: player2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          icon: Restart(),
          label: Text('Restart'),
          onPressed: () {
            // 這裡我來不及研究怎麼只 refresh GameBoard() Widget，Sorry ;)
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
