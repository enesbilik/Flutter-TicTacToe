import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_last/screens/game_page_rd.dart';
import 'game_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff262626),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                "Tic Tac Toe",
                style: TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: 54,
                    color: Color(0xffffffff),
                    letterSpacing: 1.5
                    //fontWeight: FontWeight.w700
                    ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                shape: BoxShape.circle,
                endRadius: 140,
                duration: Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4.0, color: Colors.white),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(105.5, 105.5)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/logobb.png',
                          ))),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                //print("tıklandı");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 280,
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Play 1-1",
                        style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1.5,
                          fontFamily: 'Arial Rounded MT',
                          fontSize: 24,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            GestureDetector(
              onTap: () {
                //print("tıklandı");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePageRD()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 280,
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Human VS. AI",
                        style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1.5,
                          fontFamily: 'Arial Rounded MT',
                          fontSize: 24,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/config.png'),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/images/leader.png'),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
