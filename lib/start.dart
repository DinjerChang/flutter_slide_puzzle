import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slide_puzzle/carousel.dart';
import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xfffeb34c);
    dynamic page = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          toolbarHeight: page.size.height * 0.062,
          backgroundColor: primaryColor,
          leading: IconButton(
              icon: Image.asset('assets/images/game_small_logo.png',
                  height: page.textScaleFactor * 40,
                  width: page.textScaleFactor * 40),
              onPressed: () {}),
          title: Text('Pharaoh\'s Bedroom',
              style: TextStyle(
                fontFamily: 'Roboto_Condensed',
                color: Color(0xff21325E),
                fontWeight: FontWeight.bold,
                fontSize: page.textScaleFactor * 20,
              )),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/Bar_key.png',
                  height: page.textScaleFactor * 40,
                  width: page.textScaleFactor * 40),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mobile-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(child: StartPageCustomForm()),
      ),
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
    Player1_Controller.dispose();
    Player2_Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic page = MediaQuery.of(context);

    double _columnMargin = page.textScaleFactor * 50.0;
    return Container(
        margin: EdgeInsets.only(
          top: page.textScaleFactor * 50,
        ),
        alignment: Alignment.center,
        child: Container(
            width: 350,
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
                    right: page.textScaleFactor * 50,
                    top: page.textScaleFactor * 30,
                  ),
                  child: Text("Pharaoh\'s",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto_Condensed',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffacb5a),
                        fontSize: page.textScaleFactor * 25,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: page.textScaleFactor * 115,
                    top: page.textScaleFactor * 10,
                  ),
                  child: Text("Bedroom",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto_Condensed',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffacb5a),
                        fontSize: page.textScaleFactor * 25,
                      )),
                ),
                Container(
                    child: Image.asset('assets/images/feet_win.gif',
                        height: page.textScaleFactor * 80,
                        width: page.textScaleFactor * 80)),
                Container(
                    margin: EdgeInsets.only(
                      left: page.textScaleFactor * 30,
                      top: page.textScaleFactor * 40,
                      bottom: page.textScaleFactor * 10,
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
                                  height: page.textScaleFactor * 40,
                                  width: page.textScaleFactor * 40)),
                          Text(
                            'Player1',
                            style: TextStyle(
                              fontFamily: 'Roboto_Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: page.textScaleFactor * 18,
                              color: Colors.white,
                              height: 1,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ])),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Theme(
                    data: ThemeData(
                        textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Colors.white,
                      selectionColor: Colors.white.withOpacity(0.5),
                      selectionHandleColor: Colors.white,
                    )),
                    child: TextFormField(
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(12),
                      ],
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
                      left: page.textScaleFactor * 30,
                      top: page.textScaleFactor * 30,
                      bottom: page.textScaleFactor * 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Image.asset('assets/images/player1.png',
                                  height: page.textScaleFactor * 40,
                                  width: page.textScaleFactor * 40)),
                          Text(
                            'Player2',
                            style: TextStyle(
                              fontFamily: 'Roboto_Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: page.textScaleFactor * 18,
                              color: Colors.white,
                              height: 1,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ])),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Theme(
                    data: ThemeData(
                        textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Colors.white,
                      selectionColor: Colors.white.withOpacity(0.5),
                      selectionHandleColor: Colors.white,
                    )),
                    child: TextFormField(
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(12),
                      ],
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
                    height: page.textScaleFactor * 47,
                    margin: EdgeInsets.only(
                      top: page.textScaleFactor * 40,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: page.textScaleFactor * 0.28,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfffeb34b),
                            onPrimary: Color(0xff21325E),
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto_Condensed',
                              ))),
                    ))
              ],
            )));
  }
}
