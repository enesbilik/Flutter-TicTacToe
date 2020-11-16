import 'package:flutter/material.dart';
import 'dart:math';

class GamePageRD extends StatefulWidget {
  @override
  _GamePageRDState createState() => _GamePageRDState();
}

class _GamePageRDState extends State<GamePageRD> {
  List selectedButtons = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  Color secondColor = Colors.tealAccent;
  static var p1 = "X";
  static var p2 = "O"; //yapay zeka
  // dynamic currentPlayer = p1;
  String winner = "";
  int _scoreX = 0;
  int _scoreO = 0;
  int _state = 0;
  List<String> board = List.filled(9, '');

  var xoStyle = TextStyle(
    fontFamily: 'MAGNETOB',
    fontSize: 52,
    color: Color(0xffffffff),
    fontWeight: FontWeight.w700,
  );

  var scoreStyle = TextStyle(
    fontFamily: 'Arial Rounded MT',
    fontSize: 36,
    letterSpacing: 1.5,
    color: Color(0xffffffff),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xff262626),
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildBoard(),
            buildRestartButton(),
          ],
        ),
      ),
    );
  }

  buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "Human: X",
                style: TextStyle(
                  fontFamily: 'Arial Rounded MT',
                  fontSize: 26,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text("$_scoreX",
                  style: TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: 36,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text("Comp: O",
                  style: TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: 26,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: 16.0,
              ),
              Text("$_scoreO",
                  style: TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: 36,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  buildBoard() {
    return Expanded(
      child: Container(
        child: GridView.builder(
          itemCount: board.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {

                if (board[index] == "") {
                  setState(() {
                    board[index] = p1;
                    _state += 1;
                    selectedButtons.remove(index);
                  });
                }
                if (_state % 2 == 1 && selectedButtons.length != 0) {
                  int buttonIndex = randomGenerator(selectedButtons);
                  setState(() {
                    board[buttonIndex] = p2;
                    _state += 1;
                    selectedButtons.remove(buttonIndex);
                  });
                }
                if (checkWinner()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 900),
                    content: Text(
                      "Winner : $winner ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ));
                  increaseWinnerScore();
                  restartGame();
                }
                if (_state == 9) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 900),
                    content: Text(
                      "Draw - Play Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ));
                  restartGame();
                }
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        board[index],
                        style: xoStyle,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  buildRestartButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          restartGame();
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 200,
          height: 54,
          color: Colors.black,
          child: Center(
            child: Text(
              "Restart",
              style: TextStyle(
                fontFamily: 'Arial Rounded MT',
                fontSize: 24,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void restartGame() {
    board = List.filled(9, 'fill');
    _state = 0;
    winner = "";
    selectedButtons = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  }

  bool checkWinner() {
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == board[i + 1] &&
          board[i] == board[i + 2] &&
          board[i] != "") {
        winner = board[i];
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == board[i + 3] &&
          board[i] == board[i + 6] &&
          board[i] != "") {
        winner = board[i];
        return true;
      }
    }
    if (board[0] == board[4] && board[0] == board[8] && board[0] != "") {
      winner = board[0];
      return true;
    }
    if (board[2] == board[4] && board[2] == board[6] && board[2] != "") {
      winner = board[2];
      return true;
    }
    return false;
  }

  void increaseWinnerScore() {
    if (winner == "X") {
      setState(() {
        _scoreX += 1;
      });
    }
    if (winner == "O") {
      setState(() {
        _scoreO += 1;
      });
    }
  }

  int randomGenerator(list) {
    Random random = Random();
    var randomList = (list..shuffle()).first;
    print(randomList);
    return randomList;
  }
}
