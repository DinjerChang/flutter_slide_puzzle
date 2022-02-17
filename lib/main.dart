import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow,
          textButtonTheme: const TextButtonThemeData(
            //style: TextButton.styleFrom(primary: Colors.blue),
          ),
          ),
            
      home: const TicTacToePage(title: 'Slide Puzzle'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the TicTacToe object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
              GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              children: List.generate(25, (index) {
                return Container(
                    padding: const EdgeInsets.all(1.0), // 加入padding，產生留白處
                    child: TextButton(
                      child: const Text("X",
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,),
                      ),
                      onPressed: () {}, // enable按鈕
                      style:ButtonStyle(
                            backgroundColor:MaterialStateProperty.all(Colors.grey))
                    ));
              }),
            ),
            Center(
                child: SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: null,
                        child: const Text('Play'),
                        style:
                            ButtonStyle(
                              backgroundColor:MaterialStateProperty.all(Colors.blue)
                            )
                            )
                          )
                        )
          ],
        ));
  }
}
