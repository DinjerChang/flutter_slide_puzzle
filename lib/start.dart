import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon:
                  FaIcon(FontAwesomeIcons.puzzlePiece, color: Colors.blue[900]),
              onPressed: () {}),
          title: Text('Ancient Slide Puzzle',
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold)),
          actions: <Widget>[
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
      body: StartPageCustomForm(),
      // Below code is deprecated, unused
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text('Let\'s Play'),
      //   onPressed: () {
      //     setState(() {
      //       player1 = _StartPageCustomForm().Player1_Controller.text.toString();
      //       print('player1: ' + player1);
      //       Navigator.of(context).pushNamed('/game', arguments: {
      //         'Player1':
      //             _StartPageCustomForm().Player1_Controller.text.toString(),
      //         'Player2':
      //             _StartPageCustomForm().Player2_Controller.text.toString()
      //       });
      //     });
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class StartPageCustomForm extends StatefulWidget {
  const StartPageCustomForm({Key? key}) : super(key: key);

  @override
  _StartPageCustomForm createState() => _StartPageCustomForm();
}

class _StartPageCustomForm extends State<StartPageCustomForm> {
  TextEditingController Player1_Controller = TextEditingController();
  TextEditingController Player2_Controller = TextEditingController();

  String player1 = "Player1";
  String player2 = "Player2";
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Player1_Controller.dispose();
    Player2_Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _columnMargin = 10.0;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: _columnMargin, top: _columnMargin),
          child: Image.asset('assets/images/shutup.gif',
            height: 200, width: 200
          )
        ),
        Container(
          margin: EdgeInsets.only(bottom: _columnMargin, top: _columnMargin),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: TextFormField(
            controller: Player1_Controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Player1 username',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _columnMargin),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: TextFormField(
            controller: Player2_Controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Player2 username',
            ),
          ),
        ),
        Container(
            width: 20,
            margin: EdgeInsets.only(top: 250),
            child: SizedBox( //不知道為什麼這裡 SizeBox沒效，要修一下 
                height: 30,
                width: 20,
                child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      player1 = Player1_Controller.text.toString();
                      player2 = Player2_Controller.text.toString();
                      Navigator.of(context).pushNamed('/game',
                          arguments: {'Player1': player1, 'Player2': player2});
                    },
                    child: Text('Let\'s Play')))),
      ],
    );
  }
}
