import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'package:flutter_slide_puzzle/controller.dart';
import 'package:flutter_slide_puzzle/win-modal.dart';
import 'package:flutter_slide_puzzle/carousel.dart';
import 'dart:math';

class SlidePuzzlePage extends StatefulWidget {
  const SlidePuzzlePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SlidePuzzlePage> createState() => _SlidePuzzlePageState();
}

class _SlidePuzzlePageState extends State<SlidePuzzlePage> {
  String player1 = "player1";
  String player2 = "player2";
  bool reload = false;
  dynamic obstacle_index_1;
  dynamic obstacle_index_2;
  dynamic obstacle_index_3;
  dynamic ANKH_index;
  dynamic p1_index;
  dynamic p2_index;
  dynamic slipper_index;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final String player1 = arguments['Player1'];
    final String player2 = arguments['Player2'];

    player1_win = false;
    player2_win = false;

    var random = Random();
    final order = [for (var i = 0; i < 25; i++) i];
    int random_case = randomINT.nextInt(8);
    switch (random_case) {
      case 0:
        {
          p1_index = 0;
          p2_index = 4;
          slipper_index = 22;
        }
        break;
      case 1:
        {
          p1_index = 4;
          p2_index = 0;
          slipper_index = 22;
        }
        break;
      case 2:
        {
          p1_index = 4;
          p2_index = 24;
          slipper_index = 10;
        }
        break;
      case 3:
        {
          p1_index = 24;
          p2_index = 4;
          slipper_index = 10;
        }
        break;
      case 4:
        {
          p1_index = 24;
          p2_index = 20;
          slipper_index = 2;
        }
        break;
      case 5:
        {
          p1_index = 20;
          p2_index = 24;
          slipper_index = 2;
        }
        break;
      case 6:
        {
          p1_index = 20;
          p2_index = 0;
          slipper_index = 14;
        }
        break;
      case 7:
        {
          p1_index = 0;
          p2_index = 20;
          slipper_index = 14;
        }
        break;
      default:
        {
          p1_index = 0;
          p2_index = 4;
          slipper_index = 22;
        }
        break;
    }
    order.remove(p1_index);
    order.remove(p2_index);

    while (true) {
      obstacle_index_1 = random.nextInt(25);
      if (obstacle_index_1 != p1_index &&
          obstacle_index_1 != p2_index &&
          obstacle_index_1 != slipper_index) {
        break;
      }
    }
    while (true) {
      obstacle_index_2 = random.nextInt(25);
      if (obstacle_index_2 != p1_index &&
          obstacle_index_2 != p2_index &&
          obstacle_index_2 != slipper_index &&
          obstacle_index_2 != obstacle_index_1) {
        break;
      }
    }
    while (true) {
      obstacle_index_3 = random.nextInt(25);
      if (obstacle_index_3 != p1_index &&
          obstacle_index_3 != p2_index &&
          obstacle_index_3 != slipper_index &&
          obstacle_index_3 != obstacle_index_1 &&
          obstacle_index_3 != obstacle_index_2) {
        break;
      }
    }
    while (true) {
      ANKH_index = random.nextInt(25);
      if (ANKH_index != p1_index &&
          ANKH_index != p2_index &&
          ANKH_index != slipper_index &&
          ANKH_index != obstacle_index_1 &&
          ANKH_index != obstacle_index_2 &&
          ANKH_index != obstacle_index_3) {
        break;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xfffeb34c),
          leading: IconButton(
              icon: Image.asset('assets/images/game_small_logo.png'),
              onPressed: () {
                Navigator.of(context).pushNamed('/start');
              }),
          title: Text('Pharaoh\'s Bedroom',
              style: TextStyle(
                  fontFamily: 'Roboto_Condensed',
                  color: Color(0xff21325E),
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(
                icon: Image.asset('assets/images/Bar_key.png'),
                tooltip: "How to Play",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Carousel();
                    }),
                  );
                })
          ]),
      body: Container(
          padding: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mobile-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Player1(playername: (player1 == "") ? "player1" : player1),
              GameBoard(
                  player1name: (player1 == "") ? "player1" : player1,
                  player2name: (player2 == "") ? "player2" : player2,
                  obstacle_index_1: obstacle_index_1,
                  obstacle_index_2: obstacle_index_2,
                  obstacle_index_3: obstacle_index_3,
                  ANKH_index: ANKH_index,
                  p1_index: p1_index,
                  p2_index: p2_index,
                  slipper_index: slipper_index,
                  order: order,
                  reload: reload),
              Player2(playername: (player2 == "") ? "player2" : player2),
              Container(
                  padding: EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        heroTag: "btn1",
                        icon: Image.asset("assets/images/pause_logo.png"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              width: 2.0,
                              color: Colors.white,
                            )),
                        backgroundColor: Color(0xffFF6835),
                        foregroundColor: Color(0xff21325E),
                        label: Text('Pause',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto_Condensed')),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 2.0,
                                color: Color(0xfffacb5a),
                              ),
                            ),
                            backgroundColor: Color(0xff21325e),
                            actionsPadding: EdgeInsets.only(
                              bottom: 15,
                            ),
                            title: const Text(
                              'Game is Paused',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Roboto_Condensed',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: <Widget>[
                              Center(
                                  child: TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Resume'),
                                      child: Container(
                                        width: 70,
                                        child: Text('Resume',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff21325E),
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Roboto_Condensed')),
                                      ),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xff21325E)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xffFEB34B)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                          width: 2.0,
                                          color: Colors.white,
                                        )),
                                      )))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      FloatingActionButton.extended(
                          heroTag: "btn2",
                          icon: Image.asset("assets/images/restart_logo.png"),
                          backgroundColor: Color(0xfffacb5a),
                          foregroundColor: Color(0xff21325E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              )),
                          label: Text('Restart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto_Condensed')),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushNamed('/game',
                                arguments: {
                                  'Player1': player1,
                                  'Player2': player2
                                });
                          }),
                    ],
                  ))
            ],
          )),
    );
  }
}
