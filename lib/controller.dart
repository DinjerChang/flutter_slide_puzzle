import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Player1 extends StatefulWidget {
  const Player1({Key? key, required this.playername}) : super(key: key);
  final String playername;
  @override
  State<Player1> createState() => _Player1State();
}

class _Player1State extends State<Player1> {
  final double _playerMargin = 20.0;
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(
          height: 57.0,
          width: 240.0,
          margin: EdgeInsets.all(_playerMargin),
          child: Stack(children: <Widget>[
            Positioned(
                left: 35,
                child: Container(
                    constraints: BoxConstraints(
                      minWidth: 120,
                    ),
                    margin: const EdgeInsets.only(top: 5.0),
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 25,
                      right: 5,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff394A83),
                        border:
                            Border.all(width: 2.0, color: Color(0xfffacb5a)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text("  " + widget.playername,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Roboto_Condensed',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
            Positioned(
                left: 10,
                child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xfffacb5a),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipOval(
                            child: Image.asset('assets/images/player2_reminder.png',
                                height: 49, width: 49, fit: BoxFit.fill))))),
          ]) 
          )
    ]);
    
  }
}

class Player2 extends StatefulWidget {
  const Player2({Key? key, required this.playername}) : super(key: key);
  final String playername;
  @override
  State<Player2> createState() => _Player2State();
}

class _Player2State extends State<Player2> {
  final double _playerMargin = 20.0;
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
          height: 60.0,
          width: 240.0,
          margin: EdgeInsets.all(_playerMargin),
          child: Stack(children: <Widget>[
            Positioned(
                left: 105,
                child: Container(
                    constraints: BoxConstraints(
                      minWidth: 120,
                    ),
                    margin: const EdgeInsets.only(top: 5.0),
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 25,
                      right: 5,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffB4452E),
                        border:
                            Border.all(width: 2.0, color: Color(0xfffacb5a)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text("  " + widget.playername,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Roboto_Condensed',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
            Positioned(
                left: 80,
                child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xfffacb5a),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipOval(
                            child: Image.asset('assets/images/player1.png',
                                height: 49, width: 49, fit: BoxFit.fill))))),
          ])
          )
    ]);
  }
}

class Restart extends StatefulWidget {
  const Restart({Key? key}) : super(key: key);

  @override
  State<Restart> createState() => _RestartState();
}

class _RestartState extends State<Restart> {
  Widget build(BuildContext context) {
    final String text_string = 'Restart';
    return FaIcon(FontAwesomeIcons.starAndCrescent);
  }
}
