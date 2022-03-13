import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game.dart';
import 'package:flutter_slide_puzzle/win-modal.dart';
import 'dart:async';
import 'dart:math';

class GameBoard extends StatefulWidget {
  const GameBoard(
      {Key? key,
      required this.player1name,
      required this.player2name,
      required this.obstacle_index_1,
      required this.obstacle_index_2,
      required this.obstacle_index_3,
      required this.ANKH_index,
      required this.reload})
      : super(key: key);
  final String player1name;
  final String player2name;
  final bool reload;
  final int obstacle_index_1;
  final int obstacle_index_2;
  final int obstacle_index_3;
  final int ANKH_index;
  @override
  State<GameBoard> createState() => _GameBoardState();
}

bool player1_win = false; // 先在遊戲開始之前宣告，之後隨著遊戲狀態改變
bool player2_win = false;
var randomINT = Random();

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
  bool selected3 = false;
  bool enable = true;
  dynamic selected_pos1_x = 10.0;
  dynamic selected_pos1_y = 20.0;
  dynamic selected_pos2_x = 0.0;
  dynamic selected_pos2_y = 0.0;
  final p1_index = 0;
  final p2_index = 4;
  final slipper_index = 22;
  dynamic switch_times = 3;
  // dynamic obstacle_index = 1;
  dynamic round = 0;
  int random_index = 0;
  int chance_triggered_times = 0;
  bool chance_triggered = false;
  // var random = Random();
  // while(true) {
  //   obstacle_index = random.nextInt(24);
  //   print("obstacle_index = " + obstacle_index.toString());
  //   if(obstacle_index != 0 && obstacle_index != 4 && obstacle_index != 22) {
  //     break;
  //   }
  // }

  final bg_index = List<int>.generate(25, (int index) => randomINT.nextInt(5),
      growable: false);

  void _onEnd1() async {
    if (selected3 && selected1 == 2) {
      setState(() {
        x_coordin[p1_index] = selected_pos1_x;
        y_coordin[p1_index] = selected_pos1_y;
        selected2 = false;
        selected3 = false;
        player1_win = true;
      });
      // print("1");
    } else {
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        selected2 = false;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        x_coordin[p1_index] = selected_pos2_x;
        y_coordin[p1_index] = selected_pos2_y;
        selected1 = 2;
        selected_pos1_x = x_coordin[p2_index];
        selected_pos1_y = y_coordin[p2_index];
        selected3 = false;
        // enable = true;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      if(chance_triggered) {
        final temp_x = x_coordin[slipper_index];
        final temp_y = y_coordin[slipper_index];
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          x_coordin[slipper_index] = x_coordin[random_index];
          y_coordin[slipper_index] = y_coordin[random_index];
          x_coordin[random_index] = temp_x;
          y_coordin[random_index] = temp_y;
          // chance_triggered = false;
        });
      }
    }
  }

  void _onEnd2() async {
    if (selected3 && selected1 == 1) {
      setState(() {
        x_coordin[p2_index] = selected_pos1_x;
        y_coordin[p2_index] = selected_pos1_y;
        selected2 = false;
        selected3 = false;
        player1_win = true;
      });
      // print("2");
    } else {
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        selected2 = false;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      if (x_coordin[p2_index] == x_coordin[22] &&
          y_coordin[p2_index] == y_coordin[22]) {
        setState(() {
          player2_win = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        x_coordin[p2_index] = selected_pos2_x;
        y_coordin[p2_index] = selected_pos2_y;
        selected1 = 1;
        selected_pos1_x = x_coordin[p1_index];
        selected_pos1_y = y_coordin[p1_index];
        // selected3 = false;
        // enable = true;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      if(chance_triggered) {
        final temp_x = x_coordin[slipper_index];
        final temp_y = y_coordin[slipper_index];
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          x_coordin[slipper_index] = x_coordin[random_index];
          y_coordin[slipper_index] = y_coordin[random_index];
          x_coordin[random_index] = temp_x;
          y_coordin[random_index] = temp_y;
          // chance_triggered = false;
        });
      }
    }
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
        if(!chance_triggered) {
          setState(() {
            x_coordin[index] = selected_pos1_x;
            y_coordin[index] = selected_pos1_y;
            round = round + 1;
          });
        }
        // else {
        //   setState(() {
        //     chance_triggered = false;
        //   });
        // }
        // print(bg_index);
      },
      left: !chance_triggered && (selected1 != 0 && selected2) &&
              (selected_pos2_x == x_coordin[index] &&
                  selected_pos2_y == y_coordin[index])
          ? selected_pos1_x
          : x_coordin[index],
      top: !chance_triggered && (selected1 != 0 && selected2) &&
              (selected_pos2_x == x_coordin[index] &&
                  selected_pos2_y == y_coordin[index])
          ? selected_pos1_y
          : y_coordin[index],
      duration: const Duration(milliseconds: duration),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: () async {
          if (selected2 ||
              (selected1 == 0 && !selected2) ||
              (x_coordin[index] - selected_pos1_x).abs() +
                      (y_coordin[index] - selected_pos1_y).abs() ==
                  70) {
            if ((index != widget.obstacle_index_1 || round < 6) 
            && (index != widget.obstacle_index_2 || round < 12)
            && (index != widget.obstacle_index_3 || round < 18)) {
              if(index == widget.ANKH_index && round >= 10 && chance_triggered_times < 1) {
                while(true) {
                  random_index = randomINT.nextInt(25);
                  if(random_index != slipper_index && random_index != p1_index && random_index != p2_index) break;
                }
                setState(() {
                  selected_pos2_x = x_coordin[index];
                  selected_pos2_y = y_coordin[index];
                  selected2 = !selected2;
                  // chance_triggered = true;
                  // enable = false;
                });
                await Future.delayed(const Duration(milliseconds: 300));
                setState(() {
                  chance_triggered = true;
                  // chance_triggered_times += 1;
                });
                await Future.delayed(const Duration(milliseconds: 300));
                setState(() {
                  chance_triggered_times += 1;
                });
              }
              else if (index == 22 && selected1 == 1) {
                if (switch_times > 0) {
                  setState(() {
                    selected_pos2_x = x_coordin[index];
                    selected_pos2_y = y_coordin[index];
                    selected2 = !selected2;
                    chance_triggered = false;
                    // enable = false;
                  });
                  switch_times--;
                }
              } else {
                setState(() {
                  selected_pos2_x = x_coordin[index];
                  selected_pos2_y = y_coordin[index];
                  selected2 = !selected2;
                  chance_triggered = false;
                  // enable = false;
                });
              }
            }
          }
        },
        child: Container(
            margin: EdgeInsets.all(_margin),
            width: _width,
            height: _height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: index == 22
                    ? ExactAssetImage('assets/images/SLIPPER-DEFAULT.png')
                    : ((index == widget.obstacle_index_1 && round >= 6) 
                    || (index == widget.obstacle_index_2 && round >= 12) 
                    || (index == widget.obstacle_index_3 && round >= 18))
                        ? ExactAssetImage('assets/images/obstacle.png')
                        : (index == widget.ANKH_index && round >= 10 && chance_triggered_times < 1) 
                          ? chance_triggered 
                            ? ExactAssetImage('assets/images/ANKH-ACTIVE.png') : ExactAssetImage('assets/images/ANKH-DEFAULT.png')
                          : (selected_pos2_x == x_coordin[index] && selected_pos2_y == y_coordin[index])
                            ? (selected1 == 1)
                              ? ExactAssetImage('assets/images/TILE-${bg_index[index] + 1}-BLUE-DOG.png')
                              : ExactAssetImage('assets/images/TILE-${bg_index[index] + 1}-RED-FEET.png')
                            : ExactAssetImage('assets/images/${bg_index[index] + 1}.png'),
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
        Winner(context, widget.player1name, player1_win);
      });
    }

    if (player2_win == true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Winner(context, widget.player2name, player1_win);
      });
    }

    // var random = Random();
    // while(true) {
    //   obstacle_index = random.nextInt(24);
    //   print("obstacle_index = " + obstacle_index.toString());
    //   if(obstacle_index != 0 && obstacle_index != 4 && obstacle_index != 22) {
    //     break;
    //   }
    // }

    return Stack(
      // child: Text(
      //   'SIGN UP',
      // ),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'remaining switch times: ' + switch_times.toString(),
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 10.0),
            child: SizedBox(
              width: 360,
              height: 390,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    onEnd: () {
                      _onEnd1();
                    },
                    left: selected3 || (selected1 == 1) && selected2
                        ? (selected3 ? x_coordin[p2_index] : selected_pos2_x)
                        : x_coordin[p1_index],
                    top: selected3 || (selected1 == 1) && selected2
                        ? (selected3 ? y_coordin[p2_index] : selected_pos2_y)
                        : y_coordin[p1_index],
                    duration: const Duration(milliseconds: duration),
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                      onTap: () {
                        if ((x_coordin[p1_index] - selected_pos1_x).abs() +
                                (y_coordin[p1_index] - selected_pos1_y).abs() ==
                            70) {
                          setState(() {
                            selected_pos2_x = x_coordin[p1_index];
                            selected_pos2_y = y_coordin[p1_index];
                            selected2 = !selected2;
                            selected3 = !selected3;
                            // enable = false;
                          });
                        }
                      },
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
                                  image: (selected1 != 1)
                                      ? ExactAssetImage(
                                          'assets/images/DOG-DEFAULT.png')
                                      : ExactAssetImage(
                                          'assets/images/DOG-ACTIVE.png'),
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
                    left: selected3 || ((selected1 == 2) && selected2)
                        ? (selected3 ? x_coordin[p1_index] : selected_pos2_x)
                        : x_coordin[p2_index],
                    top: selected3 || ((selected1 == 2) && selected2)
                        ? (selected3 ? y_coordin[p1_index] : selected_pos2_y)
                        : y_coordin[p2_index],
                    duration: const Duration(milliseconds: duration),
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                      onTap: () {
                        if ((x_coordin[p2_index] - selected_pos1_x).abs() +
                                (y_coordin[p2_index] - selected_pos1_y).abs() ==
                            70) {
                          setState(() {
                            selected_pos2_x = x_coordin[p2_index];
                            selected_pos2_y = y_coordin[p2_index];
                            selected2 = !selected2;
                            selected3 = !selected3;
                            // enable = false;
                          });
                        }
                      },
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
                                  image: (selected1 != 2)
                                      ? ExactAssetImage(
                                          'assets/images/FEET-DEFAULT.png')
                                      : ExactAssetImage(
                                          'assets/images/FEET-ACTIVE.png'),
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
            ))
      ],
    );
  }
}
