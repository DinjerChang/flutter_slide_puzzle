import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'dart:async';

Future Winner(BuildContext context , String playername, bool player1_win) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xff21325e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
            width: 4,
            color: Color(0xfffacb5a)),
      ),
      scrollable: true,
      // height: 400,
      // title:  Text(
      // "$playername, You Win !!!", 
      //   textAlign: TextAlign.center,
      // ),
      //content: const Text('Game Story Description'),
      actions: <Widget>[
      // content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Container(
          // decoration: BoxDecoration(
          //   color: Color(0xff21325e),
          //   border: Border.all(width: 4.0, color: Color(0xfffacb5a)),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          height: 400.0,
          width: 300.0,
          child: Column(
            // Text(
            // "$playername, You Win !!!", 
            //   textAlign: TextAlign.center,
            // ),
            children: <Widget>[Center(
              child: Stack(
                children: <Widget>[
                  Text(
                  "$playername, You Win !!!", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 100),
                    child: (player1_win == true) 
                    ? Image.asset('assets/images/dog_win.gif', height: 150, width: 150)
                    : Image.asset('assets/images/feet_win.gif', height: 150, width: 150)
                  ),
                  // TextButton(
                  //   // margin: EdgeInsets.only(top: 200),
                  //   onPressed: () => Navigator.of(context).pushNamed('/start'),
                  //   child:
                  //       const Text('Rematch !', style: TextStyle(color: Colors.black)),
                  //   style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(Colors.green),
                  //       ),
                  // )
                ])
            ),
            TextButton(
              // margin: EdgeInsets.only(top: 200),
              onPressed: () => Navigator.of(context).pushNamed('/start'),
              child:
                  const Text('Rematch !', style: TextStyle(color: Color(0xff21325E))),
              style: ButtonStyle(
                  // RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(18.0),
                  // ),
                  // shape: Material(
                  //   borderRadius: BorderRadius.circular(30),
                  //   side: BorderSide(
                  //       color: Color.fromARGB(255, 255, 255, 255)),
                  // ),
                backgroundColor: MaterialStateProperty.all(Color(0xfffacb5a)),
              ),
            )
            ]
          )
        )]
      )
      ],
    ),
  );
}
