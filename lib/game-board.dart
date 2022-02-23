import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game.dart';
import 'package:flutter_slide_puzzle/win-modal.dart';
import 'dart:async';
// class GameBoard extends StatefulWidget {
//   const GameBoard({Key? key}) : super(key: key);

//   @override
//   State<GameBoard> createState() => _GameBoardState();
// }

// class _GameBoardState extends State<GameBoard> {}

// import 'dart:html';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key, required this.player1name, required this.player2name}) : super(key: key);
  final String player1name;
  final String player2name;
  @override
  State<GameBoard> createState() => _GameBoardState();
}

bool player1_win = false; // 先在遊戲開始之前宣告，之後隨著遊戲狀態改變
bool player2_win = false;

class _GameBoardState extends State<GameBoard> {
  final x_coordin = List<dynamic>.generate(
      25, (int index) => (index % 5) * 70.0 + 10.0,
      growable: false);
  final y_coordin = List<dynamic>.generate(
      25, (int index) => (index ~/ 5) * 70.0 + 20.0,
      growable: false);

  final List<int> order = [
    1,
    2,
    3,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24
  ];
  // void generateOrder() {
  //   for (int i = 1; i < 25; i++) {
  //     if (i == 7) {
  //       continue;
  //     }
  //     order.add(i);
  //   }
  // }
  final _margin = 1.0;
  dynamic _color = 0xFFFFCCCC;
  final _width = 65.0;
  final _height = 65.0;
  final _interval = 10.0;
  final _circle_width = 60.0;
  final _circle_height = 60.0;
  final _starting_top = 10.0;
  final _starting_left = 10.0;
  static const duration = 200;
  dynamic selected1 = 1.0;
  bool selected2 = false;
  bool enable = true;
  dynamic selected_pos1_x = 10.0;
  dynamic selected_pos1_y = 20.0;
  dynamic selected_pos2_x = 0.0;
  dynamic selected_pos2_y = 0.0;

  void _onEnd1() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {
      selected2 = false;
    });
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {
      x_coordin[0] = selected_pos2_x;
      y_coordin[0] = selected_pos2_y;
      selected1 = 2;
      selected_pos1_x = x_coordin[4];
      selected_pos1_y = y_coordin[4];
      // enable = true;
    });
  }

  void _onEnd2() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {
      selected2 = false;
    });
    await Future.delayed(const Duration(milliseconds: 10));
    if (x_coordin[4] == x_coordin[22] && y_coordin[4] == y_coordin[22]) {
      setState(() {
        player2_win = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {
      x_coordin[4] = selected_pos2_x;
      y_coordin[4] = selected_pos2_y;
      selected1 = 1;
      selected_pos1_x = x_coordin[0];
      selected_pos1_y = y_coordin[0];
      // enable = true;
    });
    // if (x_coordin[4] == x_coordin[22] && y_coordin[4] == y_coordin[22]) {
    //   setState(() {
    //     player2_win = !player2_win;
    //   });
    // }
    // print(player2_win);
  }

  Widget buildPiece(int index) {
    return (AnimatedPositioned(
      onEnd: () {
        setState(() {
          x_coordin[index] = selected_pos1_x;
          y_coordin[index] = selected_pos1_y;
        });
      },
      left: (selected1 != 0 && selected2) &&
              (selected_pos2_x == x_coordin[index] &&
                  selected_pos2_y == y_coordin[index])
          ? selected_pos1_x
          : x_coordin[index],
      top: (selected1 != 0 && selected2) &&
              (selected_pos2_x == x_coordin[index] &&
                  selected_pos2_y == y_coordin[index])
          ? selected_pos1_y
          : y_coordin[index],
      duration: const Duration(milliseconds: duration),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: () {
          if (selected2 ||
              (selected1 == 0 && !selected2) ||
              (x_coordin[index] - selected_pos1_x).abs() +
                      (y_coordin[index] - selected_pos1_y).abs() ==
                  70) {
            setState(() {
              selected_pos2_x = x_coordin[index];
              selected_pos2_y = y_coordin[index];
              selected2 = !selected2;
              // enable = false;
            });
          }
        },
        child: Container(
            margin: EdgeInsets.all(_margin),
            width: _width,
            height: _height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: index == 22
                    ? ExactAssetImage('assets/images/slipper.png')
                    : ExactAssetImage('assets/images/${index % 5 + 1}.png'),
                fit: BoxFit.fitHeight,
              ),
            )),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (player1_win == true) {
      //這裡就是根據布林值，帶入不同使用者的名字，並去呼叫 Winner 函示 (在 win-modal.dart)
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Winner(context, widget.player1name);
      });
    }

    if (player2_win == true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Winner(context, widget.player2name);
      });
    }

    return SizedBox(
      width: 360,
      height: 390,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            onEnd: () {
              _onEnd1();
            },
            left:
                (selected1 == 1) && selected2 ? selected_pos2_x : x_coordin[0],
            top: (selected1 == 1) && selected2 ? selected_pos2_y : y_coordin[0],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(_margin),
                // color: (selected1 != 1)
                //     ? Color(0xFFFFCCCC)
                //     : Color.fromARGB(255, 255, 251, 0),
                width: _width,
                height: _height,
                child: Center(
                  child: Container(
                      width: _width,
                      height: _height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/drawer.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        border: (selected1 != 1)
                            ? null
                            : Border(
                                top: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                right: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                left: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                              ),
                      )),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                _onEnd2();
              });
            },
            left:
                (selected1 == 2) && selected2 ? selected_pos2_x : x_coordin[4],
            top: (selected1 == 2) && selected2 ? selected_pos2_y : y_coordin[4],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(_margin),
                // color: (selected1 != 2)
                //     ? Color(0xFFFFCCCC)
                //     : Color.fromARGB(255, 255, 251, 0),
                // width: _width,
                height: _height,
                child: Center(
                  child: Container(
                      width: _width,
                      height: _height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/feet.png'),
                          fit: BoxFit.fill,
                        ),
                        border: (selected1 != 2)
                            ? null
                            : Border(
                                top: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                right: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                                left: BorderSide(
                                    color: Color.fromARGB(255, 255, 251, 0),
                                    width: 3.0),
                              ),
                      )),
                ),
              ),
            ),
          ),
          for (int item in order) buildPiece(item)
        ],
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
