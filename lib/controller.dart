import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Player1 extends StatefulWidget {
  const Player1({Key? key,required this.playername}) : super(key: key);
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
              backgroundColor: Colors.blueAccent,
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipOval(
                      child: Image.asset('assets/images/feet.png',
                          height: 50, width: 50, fit: BoxFit.fill)))),
          Container(
              // margin: const EdgeInsets.all(30.0),
              // padding: const EdgeInsets.all(3.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.blueAccent, width: 3.0),
                  right: BorderSide(color: Colors.blueAccent, width: 3.0),
                  bottom: BorderSide(color: Colors.blueAccent, width: 3.0),
                  left: BorderSide(color: Colors.white, width: 0.0),
                ),
                // borderRadius: BorderRadius.all(
                //   Radius.circular(5.0)
                // )
              ),
              //             <--- BoxDecoration here
              child: Text(widget.playername,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold)))
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
            CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipOval(
                        child: Image.asset('assets/images/slipper.png',
                            height: 50, width: 50, fit: BoxFit.fill)))),
            Container(
                // margin: const EdgeInsets.all(30.0),
                // padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.blueAccent, width: 3.0),
                    right: BorderSide(color: Colors.blueAccent, width: 3.0),
                    bottom: BorderSide(color: Colors.blueAccent, width: 3.0),
                    left: BorderSide(color: Colors.white, width: 0.0),
                  ),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(5.0)
                  // )
                ),
                //             <--- BoxDecoration here
                child: Text(widget.playername,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold)))
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
    return FaIcon(
      FontAwesomeIcons.starAndCrescent
    );
  }
}
