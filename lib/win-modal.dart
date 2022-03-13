import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

Future Winner(BuildContext context, String player1name, String player2name,
    bool whowin) async {
  String gifpath;
  String playername;
  if (whowin == true) {
    // means dog win
    gifpath = 'assets/images/dog-win.gif';
    playername = player1name;
  } else {
    gifpath = 'assets/images/feet-win.gif';
    playername = player2name;
  }
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            // contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.only(top: 0, bottom: 5),
            backgroundColor: Color.fromRGBO(250, 242, 222, 1),
            title: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Color(0xff21325e),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xfffacb5a),
                            child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ClipOval(
                                    child: Image.asset(
                                        'assets/images/DOG-DEFAULT.png',
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.fill)))),
                        Text("$playername, You Win !!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xfffacb5a),
                                fontWeight: FontWeight.bold)),
                      ])),
            ),
            content: Container(
              child: Image.asset(gifpath),
              margin: EdgeInsets.only(left: 5, right: 5),
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                            heroTag: "Back",
                            backgroundColor: Color(0xff21325e),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Color(0xfffacb5a), width: 2)),
                            // extendedTextStyle: TextStyle(color: Color(0xff21325E)),\
                            label: Text('  Back  ',
                                style: TextStyle(
                                    color: Color(0xfffacb5a),
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/start');
                            }),
                        FloatingActionButton.extended(
                            icon: Image.asset("assets/images/restart_logo.png"),
                            heroTag: "Play Again",
                            backgroundColor: Color(0xfffacb5a),
                            shape: StadiumBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 2)),
                            // extendedTextStyle: TextStyle(color: Color(0xff21325E)),\
                            label: Text('Play Again',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/game', arguments: {
                                'Player1': player1name,
                                'Player2': player2name,
                              });
                            })
                      ]),
                ),
              )
            ],
          ));
}
