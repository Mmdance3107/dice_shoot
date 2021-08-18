import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade400,
        appBar: AppBar(
          title: Center(child: Text('Dice',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),),
          backgroundColor: Colors.blue.shade900,
        ),
        body: DicePage(),
      ),
    ),
  );
}




class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 0;
  int rightDiceNum = 0;

  void changeDice(){
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;//[0-(6-1)] + 1 //[0-5] + 1 ==> 1-6
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }
  void resetDice(){
    setState(() {
      leftDiceNum = 0;
      rightDiceNum = 0;
    });
  }

  void playSound(int noteNum){
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  changeDice();
                  playSound(1);
                },
                child: Image.asset('assets/dice$leftDiceNum.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  changeDice();
                  playSound(2);
                },
                child: Image.asset('assets/dice$rightDiceNum.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
            child: TextButton(
              onPressed:(){
                resetDice();
                final player = AudioCache();
                player.play('reset.mp3');
              },
              child: Text('RESET',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}