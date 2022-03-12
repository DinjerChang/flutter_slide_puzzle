import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Player1 extends StatefulWidget {
  const Player1({Key? key, required this.playername}) : super(key: key);
  final String playername;
  @override
  State<Player1> createState() => _Player1State();
}

class _Player1State extends State<Player1> {
  // define future varibale here
  final double _playerMargin = 20.0;
  // String _player1_name = "Player 1";
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(_playerMargin),
        child: Row(children: <Widget>[
          CircleAvatar(
              radius: 28,
              backgroundColor: Color(0xfffacb5a),
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipOval(
                      child: Image.asset('assets/images/DOG-DEFAULT.png',
                          height: 49, width: 49, fit: BoxFit.contain)))),
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Color(0xffB4452E),
                  border: Border.all(width: 2.0, color: Color(0xfffacb5a)),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              //             <--- BoxDecoration here
              child: Text(widget.playername,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)))
        ]) //這裡之後應該要改成 Image Widget
        );
  }
}

class Player2 extends StatefulWidget {
  const Player2({Key? key, required this.playername}) : super(key: key);
  final String playername;
  @override
  State<Player2> createState() => _Player2State();
}

class _Player2State extends State<Player2> {
  // define future varibale here
  final double _playerMargin = 20.0;
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
          margin: EdgeInsets.all(_playerMargin),
          child: Row(children: <Widget>[
            Positioned(
                right: 30,
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color(0xffB4452E),
                        border:
                            Border.all(width: 2.0, color: Color(0xfffacb5a)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    //             <--- BoxDecoration here
                    child: Text(widget.playername,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
            Positioned(
                right: 100,
                child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xfffacb5a),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipOval(
                            child: Image.asset('assets/images/FEET-DEFAULT.png',
                                height: 49, width: 49, fit: BoxFit.fill))))),
          ]) //這裡之後應該要改成 Image Widget
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
