import 'package:flutter/material.dart';

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
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  // var MyList = List.generate(2, (i) => List.generate(5, (j) => i * 60));
  // var MyList = [for (var i = 1; i <= 10; i++) i];
  final x_coordin = List<dynamic>.generate(
      25, (int index) => (index % 5) * 70.0 + 10.0,
      growable: false);
  final y_coordin = List<dynamic>.generate(
      25, (int index) => (index ~/ 5) * 70.0 + 20.0,
      growable: false);
  // final x_coordin =
  //     List.generate(2, (i) => List.generate(5, (dynamic j) => j * 60.0 + 40.0));
  // final y_coordin =
  //     List.generate(2, (i) => List.generate(5, (dynamic j) => i * 60.0 + 20.0));
  // final String title;
  final _margin = 1.0;
  dynamic _color = 0xFFFFCCCC;
  final _width = 65.0;
  final _height = 65.0;
  final _interval = 10.0;
  final _circle_width = 30.0;
  final _circle_height = 30.0;
  final _starting_top = 10.0;
  final _starting_left = 10.0;
  static const duration = 500;
  bool selected1 = false;
  bool selected2 = false;
  dynamic pos1 = 50.0;
  dynamic pos2 = 110.0;
  dynamic pos3 = 170.0;
  dynamic pos4 = 230.0;
  dynamic pos5 = 290.0;
  dynamic selected_pos1_x = 50.0;
  dynamic selected_pos1_y = 0.0;
  dynamic selected_pos2_x = 0.0;
  dynamic selected_pos2_y = 0.0;
  // dynamic pos = List<double>.empty();
  // pos.add(pos1);
  // for(var i = 0; i < 5; i++) {
  //   print(i);
  // }
  // var pos = new List(5);
  @override

  // State<MyHomePage> createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 390,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            onEnd: () {
              // final temp = selected_pos1;
              setState(() {
                x_coordin[0] = selected_pos2_x;
                y_coordin[0] = selected_pos2_y;
                // pos1 = selected_pos2;
                // pos1_y = selected_pos2_y;

                // selected_pos1 = selected_pos2;
                // pos2 = selected_pos1;
                selected1 = false;
                selected2 = false;
              });
              print(x_coordin);
              print(y_coordin);
              // print("pos1 = $pos1");
              // print("pos2 = $pos2");
            },
            left: selected1 && selected2 ? selected_pos2_x : x_coordin[0],
            top: selected1 && selected2 ? selected_pos2_y : y_coordin[0],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected1 = !selected1;
                  selected_pos1_x = x_coordin[0];
                  selected_pos1_y = y_coordin[0];
                  // _color = (selected1) ? Color(0xFFFFCCCC) : Color(0xFFFF0000);
                  // selected2 = false;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blue)
                // ),
                color: !selected1 ? Color(0xFFFFCCCC) : Color(0xFFFF0000),
                width: _width,
                height: _height,
                child: Center(
                  child: Container(
                    width: _circle_width,
                    height: _circle_height,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[1] = selected_pos1_x;
                y_coordin[1] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[1] &&
                        selected_pos2_y == y_coordin[1])
                ? selected_pos1_x
                : x_coordin[1],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[1] &&
                        selected_pos2_y == y_coordin[1])
                ? selected_pos1_y
                : y_coordin[1],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[1];
                  selected_pos2_y = y_coordin[1];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[1] ||
                            selected_pos2_y != y_coordin[1]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                // color: Colors.yellow,
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[2] = selected_pos1_x;
                y_coordin[2] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[2] &&
                        selected_pos2_y == y_coordin[2])
                ? selected_pos1_x
                : x_coordin[2],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[2] &&
                        selected_pos2_y == y_coordin[2])
                ? selected_pos1_y
                : y_coordin[2],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[2];
                  selected_pos2_y = y_coordin[2];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[2] ||
                            selected_pos2_y != y_coordin[2]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                // color: Colors.yellow,
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[3] = selected_pos1_x;
                y_coordin[3] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[3] &&
                        selected_pos2_y == y_coordin[3])
                ? selected_pos1_x
                : x_coordin[3],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[3] &&
                        selected_pos2_y == y_coordin[3])
                ? selected_pos1_y
                : y_coordin[3],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[3];
                  selected_pos2_y = y_coordin[3];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[3] ||
                            selected_pos2_y != y_coordin[3]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                // color: Colors.yellow,
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[4] = selected_pos1_x;
                y_coordin[4] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[4] &&
                        selected_pos2_y == y_coordin[4])
                ? selected_pos1_x
                : x_coordin[4],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[4] &&
                        selected_pos2_y == y_coordin[4])
                ? selected_pos1_y
                : y_coordin[4],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[4];
                  selected_pos2_y = y_coordin[4];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[4] ||
                            selected_pos2_y != y_coordin[4]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                // color: Colors.yellow,
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[5] = selected_pos1_x;
                y_coordin[5] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[5] &&
                        selected_pos2_y == y_coordin[5])
                ? selected_pos1_x
                : x_coordin[5],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[5] &&
                        selected_pos2_y == y_coordin[5])
                ? selected_pos1_y
                : y_coordin[5],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[5];
                  selected_pos2_y = y_coordin[5];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[5] ||
                            selected_pos2_y != y_coordin[5]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[6] = selected_pos1_x;
                y_coordin[6] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[6] &&
                        selected_pos2_y == y_coordin[6])
                ? selected_pos1_x
                : x_coordin[6],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[6] &&
                        selected_pos2_y == y_coordin[6])
                ? selected_pos1_y
                : y_coordin[6],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[6];
                  selected_pos2_y = y_coordin[6];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[6] ||
                            selected_pos2_y != y_coordin[6]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[7] = selected_pos1_x;
                y_coordin[7] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[7] &&
                        selected_pos2_y == y_coordin[7])
                ? selected_pos1_x
                : x_coordin[7],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[7] &&
                        selected_pos2_y == y_coordin[7])
                ? selected_pos1_y
                : y_coordin[7],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[7];
                  selected_pos2_y = y_coordin[7];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[7] ||
                            selected_pos2_y != y_coordin[7]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[8] = selected_pos1_x;
                y_coordin[8] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[8] &&
                        selected_pos2_y == y_coordin[8])
                ? selected_pos1_x
                : x_coordin[8],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[8] &&
                        selected_pos2_y == y_coordin[8])
                ? selected_pos1_y
                : y_coordin[8],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[8];
                  selected_pos2_y = y_coordin[8];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[8] ||
                            selected_pos2_y != y_coordin[8]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[9] = selected_pos1_x;
                y_coordin[9] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[9] &&
                        selected_pos2_y == y_coordin[9])
                ? selected_pos1_x
                : x_coordin[9],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[9] &&
                        selected_pos2_y == y_coordin[9])
                ? selected_pos1_y
                : y_coordin[9],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[9];
                  selected_pos2_y = y_coordin[9];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[9] ||
                            selected_pos2_y != y_coordin[9]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[10] = selected_pos1_x;
                y_coordin[10] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[10] &&
                        selected_pos2_y == y_coordin[10])
                ? selected_pos1_x
                : x_coordin[10],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[10] &&
                        selected_pos2_y == y_coordin[10])
                ? selected_pos1_y
                : y_coordin[10],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[10];
                  selected_pos2_y = y_coordin[10];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[10] ||
                            selected_pos2_y != y_coordin[10]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[11] = selected_pos1_x;
                y_coordin[11] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[11] &&
                        selected_pos2_y == y_coordin[11])
                ? selected_pos1_x
                : x_coordin[11],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[11] &&
                        selected_pos2_y == y_coordin[11])
                ? selected_pos1_y
                : y_coordin[11],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[11];
                  selected_pos2_y = y_coordin[11];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[11] ||
                            selected_pos2_y != y_coordin[11]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[12] = selected_pos1_x;
                y_coordin[12] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[12] &&
                        selected_pos2_y == y_coordin[12])
                ? selected_pos1_x
                : x_coordin[12],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[12] &&
                        selected_pos2_y == y_coordin[12])
                ? selected_pos1_y
                : y_coordin[12],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[12];
                  selected_pos2_y = y_coordin[12];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[12] ||
                            selected_pos2_y != y_coordin[12]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[13] = selected_pos1_x;
                y_coordin[13] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[13] &&
                        selected_pos2_y == y_coordin[13])
                ? selected_pos1_x
                : x_coordin[13],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[13] &&
                        selected_pos2_y == y_coordin[13])
                ? selected_pos1_y
                : y_coordin[13],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[13];
                  selected_pos2_y = y_coordin[13];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[13] ||
                            selected_pos2_y != y_coordin[13]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[14] = selected_pos1_x;
                y_coordin[14] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[14] &&
                        selected_pos2_y == y_coordin[14])
                ? selected_pos1_x
                : x_coordin[14],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[14] &&
                        selected_pos2_y == y_coordin[14])
                ? selected_pos1_y
                : y_coordin[14],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[14];
                  selected_pos2_y = y_coordin[14];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[14] ||
                            selected_pos2_y != y_coordin[14]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[15] = selected_pos1_x;
                y_coordin[15] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[15] &&
                        selected_pos2_y == y_coordin[15])
                ? selected_pos1_x
                : x_coordin[15],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[15] &&
                        selected_pos2_y == y_coordin[15])
                ? selected_pos1_y
                : y_coordin[15],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[15];
                  selected_pos2_y = y_coordin[15];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[15] ||
                            selected_pos2_y != y_coordin[15]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[16] = selected_pos1_x;
                y_coordin[16] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[16] &&
                        selected_pos2_y == y_coordin[16])
                ? selected_pos1_x
                : x_coordin[16],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[16] &&
                        selected_pos2_y == y_coordin[16])
                ? selected_pos1_y
                : y_coordin[16],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[16];
                  selected_pos2_y = y_coordin[16];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[16] ||
                            selected_pos2_y != y_coordin[16]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[17] = selected_pos1_x;
                y_coordin[17] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[17] &&
                        selected_pos2_y == y_coordin[17])
                ? selected_pos1_x
                : x_coordin[17],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[17] &&
                        selected_pos2_y == y_coordin[17])
                ? selected_pos1_y
                : y_coordin[17],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[17];
                  selected_pos2_y = y_coordin[17];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[17] ||
                            selected_pos2_y != y_coordin[17]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[18] = selected_pos1_x;
                y_coordin[18] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[18] &&
                        selected_pos2_y == y_coordin[18])
                ? selected_pos1_x
                : x_coordin[18],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[18] &&
                        selected_pos2_y == y_coordin[18])
                ? selected_pos1_y
                : y_coordin[18],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[18];
                  selected_pos2_y = y_coordin[18];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[18] ||
                            selected_pos2_y != y_coordin[18]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[19] = selected_pos1_x;
                y_coordin[19] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[19] &&
                        selected_pos2_y == y_coordin[19])
                ? selected_pos1_x
                : x_coordin[19],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[19] &&
                        selected_pos2_y == y_coordin[19])
                ? selected_pos1_y
                : y_coordin[19],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[19];
                  selected_pos2_y = y_coordin[19];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[19] ||
                            selected_pos2_y != y_coordin[19]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[20] = selected_pos1_x;
                y_coordin[20] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[20] &&
                        selected_pos2_y == y_coordin[20])
                ? selected_pos1_x
                : x_coordin[20],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[20] &&
                        selected_pos2_y == y_coordin[20])
                ? selected_pos1_y
                : y_coordin[20],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[20];
                  selected_pos2_y = y_coordin[20];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[20] ||
                            selected_pos2_y != y_coordin[20]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[21] = selected_pos1_x;
                y_coordin[21] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[21] &&
                        selected_pos2_y == y_coordin[21])
                ? selected_pos1_x
                : x_coordin[21],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[21] &&
                        selected_pos2_y == y_coordin[21])
                ? selected_pos1_y
                : y_coordin[21],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[21];
                  selected_pos2_y = y_coordin[21];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[21] ||
                            selected_pos2_y != y_coordin[21]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[22] = selected_pos1_x;
                y_coordin[22] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[22] &&
                        selected_pos2_y == y_coordin[22])
                ? selected_pos1_x
                : x_coordin[22],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[22] &&
                        selected_pos2_y == y_coordin[22])
                ? selected_pos1_y
                : y_coordin[22],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[22];
                  selected_pos2_y = y_coordin[22];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[22] ||
                            selected_pos2_y != y_coordin[22]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[23] = selected_pos1_x;
                y_coordin[23] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[23] &&
                        selected_pos2_y == y_coordin[23])
                ? selected_pos1_x
                : x_coordin[23],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[23] &&
                        selected_pos2_y == y_coordin[23])
                ? selected_pos1_y
                : y_coordin[23],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[23];
                  selected_pos2_y = y_coordin[23];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[23] ||
                            selected_pos2_y != y_coordin[23]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
          AnimatedPositioned(
            onEnd: () {
              setState(() {
                x_coordin[24] = selected_pos1_x;
                y_coordin[24] = selected_pos1_y;
              });
            },
            left: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[24] &&
                        selected_pos2_y == y_coordin[24])
                ? selected_pos1_x
                : x_coordin[24],
            top: (selected1 && selected2) &&
                    (selected_pos2_x == x_coordin[24] &&
                        selected_pos2_y == y_coordin[24])
                ? selected_pos1_y
                : y_coordin[24],
            duration: const Duration(milliseconds: duration),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected_pos2_x = x_coordin[24];
                  selected_pos2_y = y_coordin[24];
                  selected2 = !selected2;
                });
              },
              child: Container(
                margin: EdgeInsets.all(_margin),
                color: (!selected2 ||
                        (selected_pos2_x != x_coordin[24] ||
                            selected_pos2_y != y_coordin[24]))
                    ? Color(0xFFFFCCCC)
                    : Color(0xFFFF0000),
                width: _width,
                height: _height,
              ),
            ),
          ),
        ],
      ),
    );
    // Stack(
    //   children: <Widget>[
    // onTap: (){
    //   print("Container clicked");
    // },
    // Positioned(
    // top:  _starting_top,
    // left: _starting_left,
    // AnimatedPositioned(
    //   width: selected ? 200.0 : 50.0,
    //   height: selected ? 50.0 : 200.0,
    //   top: selected ? 50.0 : 150.0,
    //   duration: const Duration(seconds: 2),
    //   curve: Curves.fastOutSlowIn,
    //   child: GestureDetector(
    // onTapDown: (details) {
    //   print(details.globalPosition);
    //   print(details.localPosition);
    // },
    // onTap: () {
    //   setState(() {
    //     selected = !selected;
    //   });
    // },
    // child: Container(
    //   // margin: EdgeInsets.all(_margin),
    //   color: Color(_color),
    // width: _width,
    // height: _height,
    // child: Center(
    //   child: Container(
    //     width: _circle_width,
    //     height: _circle_height,
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       shape: BoxShape.circle
    //     ),
    //   ),
    // ),
    //     ),
    //   ),
    // ),
    // ),
    // ),

    // Positioned(
    //   top:  _starting_top,
    //   left: _starting_left + _width + _interval,
    //   child: Container(
    //     margin: EdgeInsets.all(_margin),
    //     color: Color(_color),
    //     width: _width,
    //     height: _height,
    //   ),
    // ),
    // Positioned(
    //   top:  _starting_top,
    //   left: _starting_left + 2 * (_width + _interval),
    //   child: Container(
    //     margin: EdgeInsets.all(_margin),
    //     color: Color(_color),
    //     width: _width,
    //     height: _height,
    //   ),
    // ),
    // Positioned(
    //   top:  _starting_top,
    //   left: _starting_left + 3 * (_width + _interval),
    //   child: Container(
    //     margin: EdgeInsets.all(_margin),
    //     color: Color(_color),
    //     width: _width,
    //     height: _height,
    //   ),
    // ),
    // Positioned(
    //   top:  _starting_top,
    //   left: _starting_left + 4 * (_width + _interval),
    //   child: Container(
    //     margin: EdgeInsets.all(_margin),
    //     color: Color(_color),
    //     width: _width,
    //     height: _height,
    //   ),
    // ),
    // onPressed() {
    //   left: 20;
    // },

    // ),
    // Container(
    //   margin: EdgeInsets.all(_margin),
    //   color: Color(_color),
    //   width: _width,
    //   height: _height,
    // ),
    // Container(
    //   margin: EdgeInsets.all(_margin),
    //   color: Color(_color),
    //   width: _width,
    //   height: _height,
    // ),
    // Container(
    //   margin: EdgeInsets.all(_margin),
    //   color: Color(_color),
    //   width: _width,
    //   height: _height,
    // ),

    //   ]
    // ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),

    //   ]
    // ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),

    //   ]
    // ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //     ),
    //     Container(
    //       margin: EdgeInsets.all(_margin),
    //       color: Color(_color),
    //       width: _width,
    //       height: _height,
    //       child: Center(
    //         child: Container(
    //           width: _circle_width,
    //           height: _circle_height,
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //             shape: BoxShape.circle
    //           ),
    //         ),
    //       )
    //     ),

    //   ]
    // )
    //   ])]
    //     ])
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
