import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'dart:async';

// Future Winner(BuildContext context , String playername, bool player1_win) async {
//   return showDialog<bool>(
//     context: context,
//     builder: (context) => AlertDialog(
//       backgroundColor: Color(0xff21325e),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(
//             width: 4,
//             color: Color(0xfffacb5a)),
//       ),
//       scrollable: true,
//       // height: 400,
//       // title:  Text(
//       // "$playername, You Win !!!", 
//       //   textAlign: TextAlign.center,
//       // ),
//       //content: const Text('Game Story Description'),
//       actions: <Widget>[
//       // content:
//       Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[Container(
//           // decoration: BoxDecoration(
//           //   color: Color(0xff21325e),
//           //   border: Border.all(width: 4.0, color: Color(0xfffacb5a)),
//           //   borderRadius: BorderRadius.circular(10),
//           // ),
//           height: 400.0,
//           width: 300.0,
//           child: Column(
//             // Text(
//             // "$playername, You Win !!!", 
//             //   textAlign: TextAlign.center,
//             // ),
//             children: <Widget>[Center(
//               child: Stack(
//                 children: <Widget>[
//                   Text(
//                   "$playername, You Win !!!", 
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 50, bottom: 100),
//                     child: (player1_win == true) 
//                     ? Image.asset('assets/images/dog_win.gif', height: 150, width: 150)
//                     : Image.asset('assets/images/feet_win.gif', height: 150, width: 150)
//                   ),
//                   // TextButton(
//                   //   // margin: EdgeInsets.only(top: 200),
//                   //   onPressed: () => Navigator.of(context).pushNamed('/start'),
//                   //   child:
//                   //       const Text('Rematch !', style: TextStyle(color: Colors.black)),
//                   //   style: ButtonStyle(
//                   //         backgroundColor: MaterialStateProperty.all(Colors.green),
//                   //       ),
//                   // )
//                 ])
//             ),
//             TextButton(
//               // margin: EdgeInsets.only(top: 200),
//               onPressed: () => Navigator.of(context).pushNamed('/start'),
//               child:
//                   const Text('Rematch !', style: TextStyle(color: Color(0xff21325E))),
//               style: ButtonStyle(
//                   // RoundedRectangleBorder(
//                   //   borderRadius: BorderRadius.circular(18.0),
//                   // ),
//                   // shape: Material(
//                   //   borderRadius: BorderRadius.circular(30),
//                   //   side: BorderSide(
//                   //       color: Color.fromARGB(255, 255, 255, 255)),
//                   // ),
//                 backgroundColor: MaterialStateProperty.all(Color(0xfffacb5a)),
//               ),
//             )
//             ]
//           )
//         )]
//       )
//       ],
//     ),
//   );
// }

Future Winner(BuildContext context, String player1name, String player2name,
    bool player1_win) async {
  String gifpath;
  String playername;
  if (player1_win == true) {
    // means dog win
    gifpath = 'assets/images/dog_win.gif';
    playername = player1name;
  } else {
    gifpath = 'assets/images/feet_win.gif';
    playername = player2name;
  }
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            // contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                width: 4,
                color: Color(0xfffacb5a)),
            ),
            titlePadding: EdgeInsets.only(top: 0, bottom: 5),
            backgroundColor: Color.fromRGBO(250, 242, 222, 1),
            title: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Color(0xff21325e),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Center (
                          
                        // )
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xfffacb5a),
                            child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                // padding: const EdgeInsets.only(right: 10.0),
                                child: ClipOval(
                                    child: 
                                        player1_win ? 
                                        Image.asset(
                                        'assets/images/player2_reminder.png',
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.fill) : 
                                        Image.asset(
                                        'assets/images/player1.png',
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.fill)))),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text("$playername WIN !!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xfffacb5a),
                                  fontWeight: FontWeight.bold)),
                        )
                      ])),
            ),
            content: Container(
              child: Image.asset(gifpath),
              margin: EdgeInsets.only(left: 5, right: 5),
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                            heroTag: "Back",
                            backgroundColor: Color(0xff21325e),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Color(0xfffacb5a), width: 2)),
                            // extendedTextStyle: TextStyle(color: Color(0xff21325E)),\
                            label: Text('  Back  ',
                                style: TextStyle(
                                    color: Color(0xfffacb5a),
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/start');
                            }),
                        FloatingActionButton.extended(
                            icon: Image.asset("assets/images/restart_logo.png"),
                            heroTag: "Play Again",
                            backgroundColor: Color(0xfffacb5a),
                            shape: StadiumBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 2)),
                            // extendedTextStyle: TextStyle(color: Color(0xff21325E)),\
                            label: Text('Play Again',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/game', arguments: {
                                'Player1': player1name,
                                'Player2': player2name,
                              });
                            })
                      ]),
                ),
              )
            ],
          ));
}
