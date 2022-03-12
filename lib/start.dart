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
    const primaryColor = Color(0xfffeb34c);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              icon:
                  FaIcon(FontAwesomeIcons.puzzlePiece, color: Colors.blue[900]),
              onPressed: () {}),
          title: Text('Pharaoh\'s bedroom',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold)),
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
    double _columnMargin = 50.0;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mobile-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
            width: 300,
            height: 600,
            decoration: BoxDecoration(
              color: Color(0xff21325e),
              border: Border.all(width: 4.0, color: Color(0xfffacb5a)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container(
                //     margin:
                //         EdgeInsets.only(bottom: _columnMargin, top: _columnMargin),
                //     child: Image.asset('assets/images/shutup.gif',
                //         height: 200, width: 200)),
                Container(
                  margin: EdgeInsets.only(top: _columnMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: TextFormField(
                    controller: Player1_Controller,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xfffacb5a), width: 2.0),
                        ),
                        hintText: 'Please enter your name',
                        labelText: 'Player1',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: _columnMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: TextFormField(
                    controller: Player2_Controller,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfffacb5a), width: 2.0),
                      ),
                      hintText: 'Please enter your name',
                      labelText: 'Player2',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 10, // <-- Your width
                    height: 30,
                    margin: EdgeInsets.only(
                      top: 280,
                    ),
                    child: Container(
                      // margin: EdgeInsets.only(top: 250),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50, 50),
                            // maximumSize: const Size(50, 50),
                            // fixedSize: const Size(10, 10),
                          ),
                          onPressed: () {
                            player1 = Player1_Controller.text.toString();
                            player2 = Player2_Controller.text.toString();
                            Navigator.of(context).pushNamed('/game',
                                arguments: {
                                  'Player1': player1,
                                  'Player2': player2
                                });
                          },
                          child: Text('Start')),
                    ))
              ],
            )));
  }
}
