import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String userChoice = '';
  String compChoice = '';
  String message = '';
  double myPoints = 0.0;
  bool hasChosen = false;
  List<String> _choices = ['kagit', 'tas', 'makas'];
  Widget iPicked = Container(), compPicked = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0, bottom: 8.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
          HSLColor.fromAHSL(1, 239, 0.49, 0.15).toColor(),
        ])),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0,
                      color: HSLColor.fromAHSL(1, 217, 0.16, 0.45).toColor()),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'tas\nkagit\nMakas',
                    style: GoogleFonts.barlowSemiCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(100, 80)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: null,
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Skor\n',
                                  style: GoogleFonts.barlowSemiCondensed(
                                      fontSize: 15.0,
                                      color:
                                          HSLColor.fromAHSL(1, 229, 0.64, 0.46)
                                              .toColor())),
                              TextSpan(
                                  text: myPoints.toString(),
                                  style: GoogleFonts.barlowSemiCondensed(
                                      fontSize: 40.0,
                                      color:
                                          HSLColor.fromAHSL(1, 229, 0.25, 0.31)
                                              .toColor()))
                            ]),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: hasChosen
                  ? Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                iPicked,
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Seçimim',
                                  style: GoogleFonts.barlowSemiCondensed(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                compPicked,
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Rakibinin seçimi',
                                  style: GoogleFonts.barlowSemiCondensed(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          message,
                          style: GoogleFonts.barlowSemiCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60.0, vertical: 10.0)),
                            onPressed: () {
                              setState(() {
                                hasChosen = false;
                              });
                            },
                            child: Text(
                              'Tekrar Oyna',
                              style: GoogleFonts.barlowSemiCondensed(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ))
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                userChoice = 'kagit';
                                userClicking();
                              },
                              child: BigCircle(
                                  SvgPicture.asset('images/icon-paper.svg'),
                                  HSLColor.fromAHSL(1, 230, 0.89, 0.62)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 230, 0.49, 0.65)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 229, 0.64, 0.49)
                                      .toColor()),
                            ),
                            InkWell(
                              onTap: () {
                                userChoice = 'makas';
                                userClicking();
                              },
                              child: BigCircle(
                                  SvgPicture.asset('images/icon-scissors.svg'),
                                  HSLColor.fromAHSL(1, 39, 0.89, 0.49)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 40, 0.84, 0.53)
                                      .toColor(),
                                  HSLColor.fromAHSL(1, 39, 0.64, 0.46)
                                      .toColor()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: () {
                            userChoice = 'tas';
                            userClicking();
                          },
                          child: BigCircle(
                              SvgPicture.asset('images/icon-rock.svg'),
                              HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
                              HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
                              HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor()),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  userClicking() {
    compChoices();
    whoWon(userChoice, compChoice);
    setState(() {
      myPoints;
      hasChosen;
    });
  }

  void compChoices() {
    Random random = Random();
    int randomNumber = random.nextInt(3);
    compChoice = _choices[randomNumber];
  }

  void whoWon(userC, compC) {
    var rpsChoices = {
      'tas': {'makas': 1, 'tas': 0.5, 'kagit': 0},
      'kagit': {'makas': 0, 'tas': 1, 'kagit': 0.5},
      'makas': {'makas': 0.5, 'tas': 0, 'kagit': 1},
    };
    var myScore = rpsChoices[userC]?[compC];
    upDateScore(myScore);
    picked();
    hasChosen = true;
  }

  upDateScore(myScore) {
    if (myScore == 0) {
      return {message = 'Kaybettin :(', myPoints += 0.0};
    } else if (myScore == 0.5) {
      return {message = 'Berabere!', myPoints += 0.5};
    } else {
      return {message = 'Kazandın :)', myPoints += 1};
    }
  }

  picked() {
    if (userChoice == 'kagit') {
      iPicked = BigCircle(
          SvgPicture.asset('images/icon-paper.svg'),
          HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          HSLColor.fromAHSL(1, 229, 0.64, 0.49).toColor());
    } else if (userChoice == 'makas') {
      iPicked = BigCircle(
          SvgPicture.asset('images/icon-scissors.svg'),
          HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    } else {
      iPicked = BigCircle(
          SvgPicture.asset('images/icon-rock.svg'),
          HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    }
    //computer choices
    if (compChoice == 'kagit') {
      compPicked = BigCircle(
          SvgPicture.asset('images/icon-paper.svg'),
          HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
          HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
          HSLColor.fromAHSL(1, 229, 0.64, 0.49).toColor());
    } else if (compChoice == 'makas') {
      compPicked = BigCircle(
          SvgPicture.asset('images/icon-scissors.svg'),
          HSLColor.fromAHSL(1, 39, 0.89, 0.49).toColor(),
          HSLColor.fromAHSL(1, 40, 0.84, 0.53).toColor(),
          HSLColor.fromAHSL(1, 39, 0.64, 0.46).toColor());
    } else {
      compPicked = BigCircle(
          SvgPicture.asset('images/icon-rock.svg'),
          HSLColor.fromAHSL(1, 349, 0.71, 0.52).toColor(),
          HSLColor.fromAHSL(1, 349, 0.70, 0.56).toColor(),
          HSLColor.fromAHSL(1, 349, 0.64, 0.46).toColor());
    }
  }
}

class BigCircle extends StatelessWidget {
  final Widget innerChild;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color shadowColor;
  const BigCircle(this.innerChild, this.gradientColor1, this.gradientColor2,
      this.shadowColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            gradientColor1,
            gradientColor2,
          ]),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: shadowColor, spreadRadius: 1, offset: Offset(1.0, 4))
          ],
          shape: BoxShape.circle),
      child: Container(
          padding: EdgeInsets.all(20.0),
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0.6,
                  blurRadius: 7.0,
                  offset: Offset(4, -6))
            ],
          ),
          child: innerChild),
    );
  }
}
