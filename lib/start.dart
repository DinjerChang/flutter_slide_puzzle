import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/carousel.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              icon: Image.asset('assets/images/game_small_logo.png'),
              onPressed: () {}),
          title: Text('Pharaoh\'s Bedroom',
              style: TextStyle(
                fontFamily: 'Roboto_Condensed',
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              )),
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
              },
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
                Container(
                  margin: EdgeInsets.only(
                    right: 50,
                    top: 30,
                  ),
                  child: Text("Pharaoh\'s",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto_Condensed',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffacb5a),
                        fontSize: 25,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 115,
                    top: 10,
                  ),
                  child: Text("Bedroom",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto_Condensed',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffacb5a),
                        fontSize: 25,
                      )),
                ),
                Container(
                    // margin: EdgeInsets.only(bottom: _columnMargin),
                    child: Image.asset('assets/images/feet_win.gif',
                        height: 80, width: 80)),
                Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      top: 40,
                      bottom: 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Image.asset(
                                  'assets/images/player2_reminder.png',
                                  height: 40,
                                  width: 40)),
                          Text(
                            'Player1',
                            // style: GoogleFonts.lato(
                            //   textStyle: Theme.of(context).textTheme.headline4,
                            //   fontSize: 48,
                            //   fontWeight: FontWeight.w700,
                            //   fontStyle: FontStyle.Roboto,
                            // ),
                            style: TextStyle(
                              // fontFamily: 'Arial',
                              fontFamily: 'Roboto_Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                              height: 1,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ])),
                Container(
                  // margin: EdgeInsets.only(top: _columnMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Theme(
                    data: ThemeData(
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.white,
                        selectionColor: Colors.white.withOpacity(0.5),
                        selectionHandleColor: Colors.white,
                      )
                    ),
                    child: TextFormField(
                      controller: Player1_Controller,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(
                          left: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xfffacb5a), width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xfffacb5a), width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        focusColor: Colors.white,
                        hintText: 'Please enter your name',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto_Condensed',
                          color: Color.fromARGB(255, 255, 243, 243),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      top: 30,
                      bottom: 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Image.asset('assets/images/player1.png',
                                  height: 40, width: 40)),
                          Text(
                            'Player2',
                            // style: TextStyle(
                            //   fontFamily: 'Arial',
                            //   fontSize: 18,
                            //   color: Colors.white,
                            //   height: 1,
                            // ),
                            style: TextStyle(
                              // fontFamily: 'Arial',
                              fontFamily: 'Roboto_Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                              height: 1,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ])),
                Container(
                  // margin: EdgeInsets.only(top: _columnMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Theme(
                    data: ThemeData(
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.white,
                        selectionColor: Colors.white.withOpacity(0.5),
                        selectionHandleColor: Colors.white,
                      )
                    ),
                    child: TextFormField(
                      controller: Player2_Controller,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xfffacb5a), width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xfffacb5a), width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        focusColor: Colors.white,
                        hintText: 'Please enter your name',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto_Condensed',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 40,
                    ),
                    child: FractionallySizedBox(
                      // heightFactor: 1.2,
                      widthFactor: 0.4,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(
                                0xfffacb5a), //change background color of button
                            onPrimary: Color.fromARGB(255, 0, 0, 0),
                            side: BorderSide(
                              width: 2.0,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
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
                          child: Text('Start',
                                style: TextStyle(
                                  fontFamily: 'Roboto_Condensed',
                                ))),
                    ))
              ],
            )));
  }
}
