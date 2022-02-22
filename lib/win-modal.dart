import 'package:flutter/material.dart';
import 'package:flutter_slide_puzzle/game-board.dart';
import 'dart:async';

Future Winner(BuildContext context , String playername) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title:  Text(
      "$playername, You Win !!!", 
        textAlign: TextAlign.center,
      ),
      //content: const Text('Game Story Description'),
      actions: <Widget>[
        Center(
          child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/start'),
              child:
                  const Text('Rematch !', style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green))),
        )
      ],
    ),
  );
}
