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
                children: <Widget>[
                  Text(
                    'Taş\nKağit\nMakas',
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
                                  text: 'Score\n',
                                  style: GoogleFonts.barlowSemiCondensed(
                                      fontSize: 15.0,
                                      color:
                                          HSLColor.fromAHSL(1, 229, 0.64, 0.46)
                                              .toColor())),
                              TextSpan(
                                  text: '12',
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
              padding: EdgeInsets.only(top: 30.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                              HSLColor.fromAHSL(1, 230, 0.89, 0.62).toColor(),
                              HSLColor.fromAHSL(1, 230, 0.49, 0.65).toColor(),
                            ]),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: HSLColor.fromAHSL(1, 229, 0.64, 0.46)
                                      .toColor(),
                                  spreadRadius: 1,
                                  offset: Offset(1.0, 4))
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
                            child: SvgPicture.asset('images/icon-paper.svg')),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BigCircle extends StatelessWidget {
  const BigCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
