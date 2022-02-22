import 'package:flutter/material.dart';
import 'dart:async';
// class GameBoard extends StatefulWidget {
//   const GameBoard({Key? key}) : super(key: key);

//   @override
//   State<GameBoard> createState() => _GameBoardState();
// }

// class _GameBoardState extends State<GameBoard> {}

// import 'dart:html';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

bool player1_win = false; // 先在遊戲開始之前宣告，之後隨著遊戲狀態改變
bool player2_win = false;

class _GameBoardState extends State<GameBoard> {
  final x_coordin = List<dynamic>.generate(
      25, (int index) => (index % 5) * 60.0 + 40.0,
      growable: false);
  final y_coordin = List<dynamic>.generate(
      25, (int index) => (index ~/ 5) * 60.0 + 20.0,
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
  final _margin = 5.0;
  dynamic _color = 0xFFFFCCCC;
  final _width = 50.0;
  final _height = 50.0;
  final _interval = 10.0;
  final _circle_width = 45.0;
  final _circle_height = 45.0;
  final _starting_top = 10.0;
  final _starting_left = 10.0;
  static const duration = 300;
  dynamic selected1 = 1.0;
  bool selected2 = false;
  bool enable = true;
  dynamic pos1 = 50.0;
  dynamic pos2 = 110.0;
  dynamic pos3 = 170.0;
  dynamic pos4 = 230.0;
  dynamic pos5 = 290.0;
  dynamic selected_pos1_x = 40.0;
  dynamic selected_pos1_y = 20.0;
  dynamic selected_pos2_x = 0.0;
  dynamic selected_pos2_y = 0.0;

  void _onEnd1() async {
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
      enable = true;
    });
  }

  void _onEnd2() async {
    setState(() {
      selected2 = false;
    });
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {
      x_coordin[4] = selected_pos2_x;
      y_coordin[4] = selected_pos2_y;
      selected1 = 1;
      selected_pos1_x = x_coordin[0];
      selected_pos1_y = y_coordin[0];
      enable = true;
    });
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
        onTap: enable
            ? () {
                if (selected2 ||
                    (selected1 == 0 && !selected2) ||
                    (x_coordin[index] - selected_pos1_x).abs() +
                            (y_coordin[index] - selected_pos1_y).abs() ==
                        60) {
                  setState(() {
                    selected_pos2_x = x_coordin[index];
                    selected_pos2_y = y_coordin[index];
                    selected2 = !selected2;
                    enable = false;
                  });
                }
              }
            : null,
        child: Container(
            margin: EdgeInsets.all(_margin),
            // color: (!selected2 ||
            //         (selected_pos2_x != x_coordin[index] ||
            //             selected_pos2_y != y_coordin[index]))
            //     ? Color(0xFFFFCCCC)
            //     : Color.fromARGB(255, 255, 251, 0),
            width: _width,
            height: _height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: ExactAssetImage('assets/images/${index % 5 + 1}.png'),
                fit: BoxFit.fitHeight,
              ),
            )),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 1000,
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
                color: (selected1 != 1)
                    ? Color(0xFFFFCCCC)
                    : Color.fromARGB(255, 255, 251, 0),
                width: _width,
                height: _height,
                child: Center(
                  child: Container(
                      width: _circle_width,
                      height: _circle_height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/drawer.png'),
                          fit: BoxFit.fitHeight,
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
                color: (selected1 != 2) ? Color(0xFFFFCCCC) : Color(0xFFFF0000),
                width: _width,
                height: _height,
                child: Center(
                  child: Container(
                      width: _circle_width,
                      height: _circle_height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/feet.png'),
                          fit: BoxFit.fill,
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
