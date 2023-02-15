import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
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
                      fixedSize: MaterialStateProperty.all(Size(100, 80))backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: null,
                  child: child)
            ],
          )
        ],
      ),
    );
  }
}
